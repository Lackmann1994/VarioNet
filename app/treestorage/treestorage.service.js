'use strict';

// Register `treestorage` service
angular.module('treestorage').factory('treestorage', ['$http', '$q', 'map',
    function ($http, $q, map) {
        console.log('now calling treestorage service');
        var context = this;
        this.debug = 'debug';
        this.tree = 'aaaa';
        this.clientTree = [];
        this.clientList = [];
        this.getClientTree = function () {
            return context.clientTree;
        }
        this.getClientList = function () {
            return context.clientList;
        }
        console.log(context.debug);
        this.build_tree = function(clients, userid) {
            console.log('context.build_tree');
            $http.get(( userid ? 'php/get_client.php?userid=' + userid : 'php/get_client.php')).then(function (response1) {
                if (response1.data.error_code != 0) {
                    console.log('request 1 failed');
                    return;
                }
                $http.get(( userid ? 'php/get_clients.php?userid=' + userid : 'php/get_clients.php')).then(function (response2) {
                    if (response2.data.error_code != 0) {
                        console.log('request 2 failed');
                        return;
                    }
                    $http.get(( userid ? 'php/get_systems.php?userid=' + userid : 'php/get_systems.php')).then(function (response3) {
                        if (response3.data.error_code != 0) {
                            console.log('request 3 failed');
                            return;
                        }
                        var client = response1.data.data;
                        client.clients = [];
                        client.systems = response3.data.data;
                        clients.push(client);
                        context.clientList.push(client);
                        console.log('debug');
/*                        map.addMarker2(
                            client.latitude,
                            client.longitude,
                            client.firstname + ' ' + client.lastname,
                            {
                                url: 'img/client.svg',
                            });
                        for (var system in client.systems)
                            map.addMarker2(
                                client.systems[system].latitude,
                                client.systems[system].longitude,
                                client.systems[system].ip_address,
                                {
                                    url: 'img/system.svg',
                                });*/
                        for (var e in response2.data.data) {
                            context.build_tree(client.clients, response2.data.data[e]);
                        }
                    });
                });
            });
        }

        this.build_tree(this.clientTree);


        var ready = false;
        var clients = [];
        var clientsList = [];
        var get_clients = function () {
            // console.log("ready: " + ready);
            build_tree(clients)
            return clients;
        }
        var get_clientsList = function () {
            return clientsList;
        }

        var build_tree = function (clients, userid) {
            return $q(function (resolve, reject) {
                var t0 = performance.now();
                $http.get(( userid ? 'php/get_client.php?userid=' + userid : 'php/get_client.php')).then(function (response1) {
                    if (response1.data.error_code != 0) {
                        // console.log(JSON.stringify(response1.data));
                        reject(JSON.stringify(response1.data));
                    }
                    var t1 = performance.now();
                    // console.log("request 1 success code: " + response1.data.error_code + (t1 - t0));
                    t0 = performance.now();
                    $http.get(( userid ? 'php/get_clients.php?userid=' + userid : 'php/get_clients.php')).then(function (response2) {
                        if (response2.data.error_code != 0) {
                            // console.log(JSON.stringify(response2.data));
                            reject(JSON.stringify(response2.data));
                        }
                        t1 = performance.now();
                        // console.log("request 2 success code: " + response2.data.error_code + (t1 - t0));
                        t0 = performance.now();
                        $http.get(( userid ? 'php/get_systems.php?userid=' + userid : 'php/get_systems.php')).then(function (response3) {

                            if (response3.data.error_code != 0) {
                                console.log(JSON.stringify(response3.data));
                                reject(JSON.stringify(response3.data));
                            }
                            t1 = performance.now();
                            // console.log("request 3 success code: " + response3.data.error_code + (t1 - t0));
                            // console.log(JSON.stringify(response1.data));
                            var client = response1.data.data;
                            client.clients = [];
                            client.systems = response3.data.data;
                            clients.push(client);
                            clientsList.push(client);
                            // map.addMarker(client);
                            map.addMarker2(
                                client.latitude,
                                client.longitude,
                                client.firstname + ' ' + client.lastname,
                                {
                                    url: 'img/client.svg',
                                });
                            for (var system in client.systems)
                                map.addMarker2(
                                    client.systems[system].latitude,
                                    client.systems[system].longitude,
                                    client.systems[system].ip_address,
                                    {
                                        url: 'img/system.svg',
                                    });

                            for (var e in response2.data.data) {
                                build_tree(client.clients, response2.data.data[e]);
                            }
                            resolve('done');
                        });
                    });
                });
            });
        }

        function flat(r, a) {
            var b = {};
            Object.keys(a).forEach(function (k) {
                if (k !== 'clients') {
                    b[k] = a[k];
                }
            });
            r.push(b);
            if (Array.isArray(a.clients)) {
                b.clients = a.clients.map(function (a) {
                    return a.id;
                });
                return a.clients.reduce(flat, r);
            }
            return r;
        }

        return {
            get_clients: get_clients,
            get_clientsList: get_clientsList,
            getDebug: this.debug,
            getClientTree: this.clientTree,
            getClientList: this.clientList,
            getTree: this.tree
        }
    }
]);

