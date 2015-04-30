
function getAndSetLocation() {
    console.log("getAndSetLocation");
    var x = document.getElementById("demo");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    console.log("showPosition");
    var lat = document.getElementById("lat");
    var lon = document.getElementById("lon");
    lat.value = position.coords.latitude ; 
    lon.value =  position.coords.longitude; 
    document.requestForm.submit();    
}

function initialize() {
    console.log("initialize map")   
    var lat = document.getElementById("lat").innerHTML;
    var lon = document.getElementById("lon").innerHTML; 
    var myLatLng = new google.maps.LatLng(lat,lon);
    var otherLatLng = new google.maps.LatLng(latp,lonp);
    var mapProp = {
      center:new google.maps.LatLng(lat, lon),
      zoom:18,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };
    var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);

      var marker = new google.maps.Marker({
       position: myLatLng,
       draggable: false,
       map: map,
       labelAnchor: new google.maps.Point(22, 0),
       labelStyle: {opacity: 0.75},
       labelVisible: true
     });

     marker = new google.maps.Marker({
       position: otherLatLng,
       draggable: false,
       map: map,
       labelAnchor: new google.maps.Point(22, 0),
       labelStyle: {opacity: 0.75},
       labelVisible: true
     });
}


