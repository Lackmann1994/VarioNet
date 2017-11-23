'use strict';

// Register `map` service

angular.module('map')
    .service('map', function ($q) {
        this.markers = [];
        var iw;
        var oms



        this.init = function () {
            var options = {
                center: new google.maps.LatLng(48.7203180, 12.4410),
                zoom: 13,
                disableDefaultUI: true
            }
            this.map = new google.maps.Map(
                document.getElementById("map"), options
            );
            iw = new google.maps.InfoWindow();
            oms = new OverlappingMarkerSpiderfier(this.map, {
                markersWontMove: true,
                markersWontHide: true,
                basicFormatEvents: true
            });
            this.places = new google.maps.places.PlacesService(this.map);
        }



        this.addMarker2 = function(lat, lng, name, icon){
            var marker = new google.maps.Marker({
                map: this.map,
                position: {lat: parseFloat(lat), lng: parseFloat(lng)}
            });
            google.maps.event.addListener(marker, 'spider_click', function(e) {  // 'spider_click', not plain 'click'
                iw.setContent(name);
                iw.open(map, marker);
            });
            google.maps.event.addListener(marker, 'spider_format', function(status) {
                marker.setIcon(icon);
            });
            oms.addMarker(marker);  // adds the marker to the spiderfier and the map
        }


        this.addMarker = function(client) {
            var marker;
            for(var system in client.systems){
                marker = new google.maps.Marker({
                    map: this.map,
                    position: {lat: parseFloat(client.systems[system].latitude), lng: parseFloat(client.systems[system].longitude)}
                });
                google.maps.event.addListener(marker, 'spider_click', function(e) {  // 'spider_click', not plain 'click'
                    iw.setContent('system');
                    iw.open(map, marker);
                });
                // google.maps.event.addListener(marker, 'spider_format', function(status) {
                //     marker.setIcon({
                //         url: 'img/document.png',
                //     });
                // });
                oms.addMarker(marker);  // adds the marker to the spiderfier and the map
            }

            marker = new google.maps.Marker({
                map: this.map,
                position: {lat: parseFloat(client.latitude), lng: parseFloat(client.longitude)}
            });
            google.maps.event.addListener(marker, 'spider_click', function(e) {  // 'spider_click', not plain 'click'
                iw.setContent('client');
                iw.open(map, marker);
            });
            // google.maps.event.addListener(marker, 'spider_format', function(status) {
            //     marker.setIcon({
            //         url: 'img/folder-horizontal.png',
            //     });
            // });
            oms.addMarker(marker);  // adds the marker to the spiderfier and the map
        }

    });





