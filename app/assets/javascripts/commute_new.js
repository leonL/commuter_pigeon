function initCommute() {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;

  $('.map_route').click(function() {
    var pointA = $('input#point_a').val(),
        pointB = $('input#point_b').val(),
        torontoSuffix = ' Toronto Ontario';
    pointA += torontoSuffix;
    pointB += torontoSuffix;
    directionsService.route({
      origin: pointA,
      destination: pointB,
      travelMode: google.maps.TravelMode.DRIVING
    }, function(response, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: {lat: 43.706226, lng: -79.343184}
        });
        directionsDisplay.setMap(map);
        directionsDisplay.setDirections(response);
        steps = response['routes'][0]['legs'][0]['steps'];
        ss = simplifyGoogleRouteSteps(steps);
        $('input#route_steps').val(JSON.stringify(ss));
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  });
}

function simplifyGoogleRouteSteps(steps) {
  var ss = steps.map(function(step) {
    return {
      start: step['start_point'],
      end: step['end_point']
    };
  });
  return ss;
}