'use strict';

// Register `phoneList` component, along with its associated controller and template
angular.
module('error').
factory('error', [
    function() {
        var callbacks = [];
        var error
        var getError = function () {
            return error;
        }
        var setError = function (err) {
            error = err;
            var i = 0;
            for (i = 0; i < callbacks.length; i++) {
                callbacks[i].callback(callbacks[i].context);
            }
        }
        var onErrorChange = function (callback, context) {
            callbacks.push({callback: callback, context: context});
        }
        return {
            getError: getError,
            setError: setError,
            onErrorChange: onErrorChange
        }
    }
]);

