'use strict';

// Register `map` component, along with its associated controller and template
angular.module('map').component('map', {
    templateUrl: 'map/map.template.html',
    controller: ['map',

        function mapController(Map) {

            this.place = {};




            this.search = function () {
                this.apiError = false;
                Map.search(this.searchPlace)
                    .then(
                        function (res) { // success
                            Map.addMarker(res);
                            this.place.name = res.name;
                            this.place.lat = res.geometry.location.lat();
                            this.place.lng = res.geometry.location.lng();
                        },
                        function (status) { // error
                            this.apiError = true;
                            this.apiStatus = status;
                        }
                    );
            }

            this.send = function () {
                alert(this.place.name + ' : ' + this.place.lat + ', ' + this.place.lng);
            }

            Map.init();


        }]
});

// angular.module('map')
//     .service('Map', function ($q) {
//         this.markers = [];
//         this.init = function () {
//             var options = {
//                 center: new google.maps.LatLng(40.7127837, -74.00594130000002),
//                 zoom: 13,
//                 disableDefaultUI: true
//             }
//             this.map = new google.maps.Map(
//                 document.getElementById("map"), options
//             );
//             this.places = new google.maps.places.PlacesService(this.map);
//         }
//
//         this.search = function (str) {
//             var d = $q.defer();
//             this.places.textSearch({query: str}, function (results, status) {
//                 if (status == 'OK') {
//                     d.resolve(results[0]);
//                 }
//                 else d.reject(status);
//             });
//             return d.promise;
//         }
//
//         this.addMarker = function(res) {
//             this.markers.push(new google.maps.Marker({
//                 map: this.map,
//                 position: res.geometry.location,
//                 animation: google.maps.Animation.DROP
//             }));
//             this.map.setCenter(res.geometry.location);
//         }
//
//         addMarker2 = function(/*lat, lng*/) {
//             alert('marker adding');
//             // this.markers.push(new google.maps.Marker({
//             //     map: this.map,
//             //     position: res.geometry.location,
//             // }));
//             // this.map.setCenter(res.geometry.location);
//         }
//
//         return {
//             addMarker: addMarker2
//         }
//     });