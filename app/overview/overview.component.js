'use strict';

// Register `overview` component, along with its associated controller and template
angular.module('overview').component('overview', {
    templateUrl: 'overview/overview.template.html',
    controller: ['treestorage', 'context',
        function overviewController(treestorage, context) {
            this.options = context.context;
            this.debug = 'debug';
            this.isArray = angular.isArray;
            this.clients = treestorage.getClientTree;
            // this.clients = treestorage.get_clients();
            this.clientsList = treestorage.get_clientsList();
            this.alertclients = function () {
                // console.log('json: ' + JSON.stringify(this.clientsList, null, 4));
                // console.log(JSON.stringify(treestorage.getClientTree,0,4));
            }
        }]
});




