'use strict';

// Register `selectLanguage` component, along with its associated controller and template
angular.
module('selectLanguage').
component('selectLanguage', {
    templateUrl: 'select-language/select-language.template.html',
    controller: ['communicate',
        function selectLanguageController(communicate) {
            this.language = navigator.language || navigator.userLanguage;
            communicate.setLanguage(this.language)
            this.updateLanguage = function(){
                communicate.setLanguage(this.language)
            }
    }]
});
