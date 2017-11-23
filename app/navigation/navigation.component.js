'use strict';

// Register `translation` component, along with its associated controller and template
angular.module('navigation').component('navigation', {
    templateUrl: 'navigation/navigation.template.html',
    controller: [
        function navigationController() {
            this.user;
            this.email;
            this.last_login;
            this.logout = function () {
                console.log('logging out');
            }

        }]
});
