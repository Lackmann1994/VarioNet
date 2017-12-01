'use strict';

// Register `translation` component, along with its associated controller and template
angular.module('navigation').component('navigation', {
    templateUrl: 'navigation/navigation.template.html',
    controller: ['$http',
        function navigationController($http) {
            this.user;
            this.email;
            this.last_login;
            this.logout = function () {
                console.log('logging out');
                $http.get('php/logout.php');
            }
        }]
});
