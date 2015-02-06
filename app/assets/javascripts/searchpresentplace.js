var myLatLng;

////現在地取得
  function geoLocate(){
    // 位置情報取得のオプション。高精度にする
    var position_options = {
      enableHightAccuracy: true,
       timeout           : 27000,
       frequency: 100
    };
    
    //現在地マーカー
    var image = new google.maps.MarkerImage(
              img,
              null, // size
              null, // origin
              new google.maps.Point( 15, 30 ), // anchor (move to center of marker)
              new google.maps.Size( 30, 30 ) // scaled size (required for Retina display icon)
              );
    // 現在地取得（変わる毎に更新）
    watchID = navigator.geolocation.watchPosition(success, fatal, position_options);
    

    
    //位置情報取得成功時
    function success(position){
      var myLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      map.setCenter(myLatLng);

      ini = new google.maps.Marker(
        {
        flat: true,//・・・・・・アイコンにtrueで影を付けない
        icon: image,
        map: map,
        optimized: false,
        position:myLatLng,
        title: '現在地',
        visible: true
        });

      return myLatLng;
    }
    
    // 位置情報取得失敗時
    function fatal(error){
      var message = "";
      
      switch(error.code){
        // 位置情報が取得出来ない場合
        case error.POSITION_UNAVAILABLE:
          message = "位置情報の取得ができませんでした。";
          break;
        // Geolocationの使用が許可されない場合
        case error.PERMISSION_DENIED:
          message = "位置情報取得の使用許可がされませんでした。";
          break;
        // タイムアウトした場合
        case error.PERMISSION_DENIED_TIMEOUT:
          message = "位置情報取得中にタイムアウトしました。";
          break;
      }
      window.alert(message);
      return null;
    }
  }

//クリックイベント取得
    //google.maps.event.addListener(map, 'click', function(event) {
    //    placeMarker(event.latLng);
    //});