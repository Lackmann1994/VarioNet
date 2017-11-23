'use strict';

// Register `maincontainer` component, along with its associated controller and template
angular.
module('maincontainer').
component('maincontainer', {
    templateUrl: 'maincontainer/maincontainer.template.html',
    transclude: true,
    controller: [
        function maincontainerController() {
        }]
});
