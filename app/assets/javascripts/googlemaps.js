var latlong = [37.4419, -122.1419];
window.onload = function() {
  getLocation();
};

function initialize() {
  var map = new google.maps.Map(
  document.getElementById('map'), {
    center: new google.maps.LatLng(latlong[0], latlong[1]),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latlong[0], latlong[1]),
    map: map
  });
}
 
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    // x.innerHTML = "Latitude: " + position.coords.latitude + 
    // "<br>Longitude: " + position.coords.longitude;
    latlong = [position.coords.latitude, position.coords.longitude];
    initialize();
}