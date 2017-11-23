'use strict';

// Register `overview` component, along with its associated controller and template
angular.module('overview').component('overview', {
    templateUrl: 'overview/overview.template.html',
    controller: ['treestorage', 'context',
        function overviewController(treestorage, context) {
            this.options = context.context;
            this.debug = 'debug';
            this.isArray = angular.isArray;
            this.clients = treestorage.get_clients();
            this.clientsList = treestorage.get_clientsList()
            // this.clientsFlat = treestorage.get_clients_flat();
            this.alertclients = function () {
                // console.log('json: ');
                console.log('json: ' + JSON.stringify(this.clientsList, null, 4));
                // console.log('json: ' + JSON.stringify(this.clients,null,4));
                // // console.log('json: ' + JSON.stringify(this.options,null,4));
                // console.log('length: ' + angular.equals(this.options, {}));




            }
        }]
});




