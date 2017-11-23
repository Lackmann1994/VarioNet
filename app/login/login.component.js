'use strict';

// Register `translation` component, along with its associated controller and template
angular.
module('login').
component('login', {
    templateUrl: 'login/login.template.html',
    controller: ['$http', '$location',
        function loginController($http, $location) {
            this.error = 'errorr'
            this.login = function() {//TODO remember_me TODO forgot_password
                //validate
                var data = $.param({
                    email : this.email,
                    password : this.password,
                    captcha_code : this.captcha_code
                });

                var config = {
                    headers : {
                        'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
                    }
                };
                $http.post('php/validate_login.php', data, config).then(function(response) {
                // console.log(this.error);

                    if (response.data.error_code == 0){
                        console.log('auth successful');
                        $location.path('/main');
                    }
                    else{
                        console.log(response.data.error_msg);
                        $location.path('/demo');
                    }
                });
                document.getElementById('captcha').src = 'securimage/securimage_show.php?' + Math.random()
            };
        }]
});
