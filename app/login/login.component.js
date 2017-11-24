'use strict';

// Register `translation` component, along with its associated controller and template
angular.
module('login').
component('login', {
    templateUrl: 'login/login.template.html',
    controller: ['$http', '$location',
        function loginController($http, $location) {
            this.debug = function () {
                console.log(this.captcha);
            }
            this.error = 'errorr'
            this.login = function() {//TODO remember_me TODO forgot_password
                var data = $.param({
                    email : this.email,
                    password : this.password,
                    captcha : this.captcha
                });
                var config = {
                    headers : {
                        'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
                    }
                };
                $http.post('php/validate_login.php', data, config).then(function(response) {
                    console.log(JSON.stringify(response,0,2));

                    if (response.data.error_code == 0){
                        console.log('auth successful');
                        $location.path('/main');
                    }
                    else{
                        console.log(response.data.error_msg);
                        $location.path('/demo');
                    }
                });
            };
        }]
});
