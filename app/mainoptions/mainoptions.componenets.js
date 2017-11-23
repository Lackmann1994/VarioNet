'use strict';

// Register `mainoptions` component, along with its associated controller and template
angular.
module('mainoptions').
component('mainoptions', {
    templateUrl: 'mainoptions/mainoptions.template.html',
    transclude: true,
    controller: ['context',
        function mainoptionsController(context) {
            this.clientfilters = [
                'firstname',
                'lastname',
                'email',
                'street',
                'street_nr',
                'postcode',
                'town',
                'region',
                'number'
            ];
            this.systemfilters = [
                'ip_address',
                'client_id',
                'status',
                'email',
                'street',
                'street_nr',
                'postcode',
                'town',
                'region',
                'number'
            ];
            this.removeFilter = function () {
                console.log('filters removed');
                this.filtered = false;
                for (var prop in this.client)
                    this.client[prop] = '';
                for (var prop in this.system)
                    this.system[prop] = '';
            }
            this.toggleMap = function () {
                this.map = !this.map;
            }
            this.filtered = false;
            this.map = true;
            context.setContext(this);
            this.logcontext = function () {
                console.log('this: '+ JSON.stringify(this,null,4));
                console.log('context: '+ JSON.stringify(context,null,4));
            }
        }]
});
