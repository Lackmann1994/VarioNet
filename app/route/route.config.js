angular.
module("route", ["ngRoute"])
.config(function($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl : "views/login.html"
        })
        .when("/main", {
            templateUrl : "views/main.html"
        })
        .when("/demo", {
            templateUrl : "views/demo.html"
        })
        .otherwise("/demo", {
            templateUrl : "views/demo.html"
        });
});