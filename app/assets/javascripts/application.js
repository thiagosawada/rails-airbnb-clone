//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
$(function(){

  $("#submit_address").click(function(e){
    e.preventDefault();

    var address = $("#address").val();
    var url = "https://maps.googleapis.com/maps/api/geocode/json?"
    var position = {};

    $.ajax({
      type: "GET",
      url: url,
      data: {
        address : address,
        sensor : false
      },
      success: function(data) {
        position.lat = data.results[0].geometry.location.lat;
        position.lng = data.results[0].geometry.location.lng;
        $("#display-coordinates").empty().append("<li class='list-group-item'>Latitude: " + position.lat + "</li>").append("<li class='list-group-item'>Longetude: " + position.lat + "</li>");
        var map = new google.maps.Map(document.getElementById('map'), {
                    center: { lat: position.lat, lng: position.lng },
                    zoom: 15
                  });
        var marker = new google.maps.Marker({
                        position: position,
                        map: map
                      });
      },
      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });

});
