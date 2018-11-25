    function initMap() {
        var chile = {lat: -33.45, lng: -70.6667}
        var map = new google.maps.Map(document.getElementById('map'), {
            center: chile,
            zoom: 4
        });

        var marker = new google.maps.Marker ({
            position: chile,
            map: map
        });
    }