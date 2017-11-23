'use strict';

// Register `translation` component, along with its associated controller and template
angular.
module('translation').
component('translation', {
    templateUrl: 'translation/translation.template.html',
    controller: ['communicate', '$http', '$attrs',
        function translationController(communicate, $http, $attrs) {
        var x = this;
        this.language;
        this.de = {};
        this.en = {};
        this.fr = {};

        this.$onInit = function () {
            // console.log($attrs.word);
            this.de = {};
            this.en = {};
            this.fr = {};
        }
        $attrs.$observe('word', function () {
            x.updateLanguage(x);
        })
        this.updateLanguage = function () {
            // console.log($attrs.word);
            x.language = communicate.getLanguage();
            // console.log(JSON.stringify(context));

            // if(x.hasOwnProperty(x.language))
            //     console.log('hasProperty: ' + x.language);
            if(x[x.language].hasOwnProperty($attrs.word)){
                // console.log($attrs.word + " already in dict");
                x.innerHTML = x[x.language][$attrs.word];
                return;
            }
            $http.get('translate.php?lang='+ x.language +'&word='+ $attrs.word).then(function(response) {
                switch (parseInt(response.data.error_code)){
                    case 0:
                        x[x.language][$attrs.word] = response.data.data;
                        x.innerHTML = response.data.data;
                        break;
                    case 3:
                        x.innerHTML = response.data.error_msg+$attrs.word;
                        break
                    default:
                        x.innerHTML = response.data.error_msg;
                        break
                }

            });
        }
        communicate.onLanguageChange(this.updateLanguage);
    }]
});
