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
        .when("/client", {
            templateUrl : "views/client.html"
        })
        .when("/system", {
            templateUrl : "views/system.html"
        })
        .when("/newclient", {
            templateUrl : "views/newclient.html"
        })
        .when("/newsystem", {
            templateUrl : "views/newsystem.html"
        })
        .when("/demo", {
            templateUrl : "views/demo.html"
        })
        .when("/phpinfo", {
            templateUrl : "php/info.php"
        })
        .when("/phpdemo", {
            templateUrl : "php/demo.php"
        })
        .otherwise("/demo", {
            templateUrl : "views/demo.html"
        });
});