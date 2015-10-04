function initRoadRestriction() {
  gMapsGeocoder = new google.maps.Geocoder();
  $('.geolocate').click(function() {
    var location = $(this).siblings('.segment_name').val();
    location += ' Toronto Ontario Canada';
    gMapsGeocoder.geocode({address: location}, function(response, status) {
      var latLong = response[0]['geometry']['location'],
          form = $('form#new_road_restriction');
      form.find('input#lat').val(latLong['H']);
      form.find('input#long').val(latLong['L']);
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: {lat: latLong['H'], lng: latLong['L']}
      });
      var marker = new google.maps.Marker({
          position: {lat: latLong['H'], lng: latLong['L']},
          map: map
        });
    });
  });
}
