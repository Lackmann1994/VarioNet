'use strict';

// Register `context` service
angular.
module('context').
factory('context', [
    function() {

        var shared = {};
        shared.setContext = function (context) {
            shared.context = context;
        }

        return shared;

        // var callbacks = [];
        // var context
        // var getContext = function () {
        //     return context;
        // }
        // var setContext = function (con) {
        //     context = con;
            // var i = 0;
            // for (i = 0; i < callbacks.length; i++) {
                // callbacks[i].callback(callbacks[i].context);
            // }
        // }
        // var onContextChange = function (callback, context) {
        //     callbacks.push({callback: callback, context: context});
        // }
        // return {
        //     getContext: getContext,
        //     setContext: setContext,
            // onLanguageChange: onLanguageChange
        // }
    }
]);

