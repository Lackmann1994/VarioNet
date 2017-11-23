'use strict';

// Register `communicate` service
angular.
module('communicate').
factory('communicate', [
    function() {
        var callbacks = [];
        var language
        var getLanguage = function () {
            if (language == null)
                language = 'de';//TODO get current language from server
            return language;
        }
        var setLanguage = function (lang) {
            language = lang;
            // console.log('Language set to: ' + lang);
            var i = 0;
            for (i = 0; i < callbacks.length; i++) {
                callbacks[i].callback(callbacks[i].context);
            }
            // console.log("language changed");
        }
        var onLanguageChange = function (callback, context) {
            callbacks.push({callback: callback, context: context});
        }
        return {
            getLanguage: getLanguage,
            setLanguage: setLanguage,
            onLanguageChange: onLanguageChange
        }
    }
]);

