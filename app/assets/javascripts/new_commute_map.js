function initMap() {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: {lat: 43.706226, lng: -79.343184}
  });
  directionsDisplay.setMap(map);

  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };
  document.getElementById('start').addEventListener('change', onChangeHandler);
  document.getElementById('end').addEventListener('change', onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  directionsService.route({
    origin: document.getElementById('start').value,
    destination: document.getElementById('end').value,
    travelMode: google.maps.TravelMode.DRIVING
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      steps = response['routes'][0]['legs'][0]['steps'];
      ss = simplifyGoogleRouteSteps(steps);
      ssj = JSON.stringify(ss);
      postRouteSteps(ssj);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
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

function postRouteSteps(steps) {
  $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: 'commutes',
    data: steps,
    dataType: 'json',
    success: function(m) {
      console.log(m);
    },
    error: function (result) {
      error();
    }
  });
}

