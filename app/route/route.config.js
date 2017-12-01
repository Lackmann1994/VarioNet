angular.
module("route", ["ngRoute"])
.config(function($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl : "views/login.html",
            resolve : {
                logout: function ($http) {
                    $http.get('php/logout.php').then(function (response) {
                       console.log(JSON.stringify(response,0,4));
                    });
                }
            }
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
        .otherwise("/", {
            templateUrl : "views/login.html"
        });
});