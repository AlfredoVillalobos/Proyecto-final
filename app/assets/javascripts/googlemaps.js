var latlong = [-33.437846, -70.632737];
// var handler;
$(document).on('turbolinks:load', function() {
  initialize();
});

function initialize() {
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {
      center: new google.maps.LatLng(latlong[0], latlong[1]),
      zoom: 12
    },
    internal: {
      id: 'map'
    }
  },
  function (){
    if(navigator.geolocation) { navigator.geolocation.getCurrentPosition(displayOnMap) }
    $.ajax({
      url:'/users',
      type:'GET',
      dataType:'json'
    })
    .done(function(data){
      markers = handler.addMarkers(data);
      $(markers).each(function(index, item){
        var marker = item.serviceObject 
        google.maps.event.addListener(marker.getMap(), "click", function(){
          var zoom = marker.getZoom()
          
        });
      })
      google.maps.event.addListener(handler, 'center_changed', function(){
      });
    })
    .fail(function(){
        console.log("error")
    })
    .always(function(){
        console.log("complete")
    });
   }
  );
}

function displayOnMap(position){
  var marker = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  google.maps.event.addListener(marker.serviceObject, "click", function(){
  });
  handler.map.centerOn(marker);
};
