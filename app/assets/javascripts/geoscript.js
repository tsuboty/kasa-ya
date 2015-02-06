
  


var directionsService;
var directionsDisplay;

 function setmap(p_lat,p_lon,g_lat,g_lon) {

  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsService = new google.maps.DirectionsService();
  var map;
    
    //現在地    
    p_latlng = new google.maps.LatLng(p_lat,p_lon);
    //目的地
    g_latlng = new google.maps.LatLng(g_lat,g_lon);
    //マップオプション
    var myOptions = {
      zoom: 16,
      center: p_latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    //マップ出力
    map = new google.maps.Map(document.getElementById('map'), myOptions);
       
    //経路オブジェクト
    directionsDisplay.setMap(map);
    sendRoute(p_latlng,g_latlng);

    
  }

 //経路検索
 function sendRoute(start,end) {
  var r;
  var request = {
    origin:start,
    destination:end,
    travelMode: google.maps.TravelMode.WALKING, //歩く
    unitSystem: google.maps.DirectionsUnitSystem.METRIC, //km
    optimizeWaypoints: true,//最適化された最短距離にする。
    avoidHighways: false,//trueで高速道路を使用しない
    avoidTolls: true, //trueで有料道路を使用しない
    provideRouteAlternatives: true
  };

  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);

      var distance = window.JSON.stringify(result["routes"][0]["legs"][0]["distance"]["value"]);
      var duration = window.JSON.stringify(result["routes"][0]["legs"][0]["duration"]["value"]);
      
      var url = "/search/geo/"+distance+"/"+duration;
      window.location.href = url;

      //setDistance(result);
    }
  });
 }



