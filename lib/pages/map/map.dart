import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

import 'demo_day.dart';
import 'map_search.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(55.755819, 37.617644);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(55.755819, 37.617644);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      // final marker = Marker(MarkerOptions()
      //   ..position = myLatlng
      //   ..map = map
      //   ..title = 'Hello World!'
      //   ..label = 'h'
      //   ..icon =
      //       'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

      // Another marker
      final marker = Marker(
        MarkerOptions()
          ..position = myLatlng
          ..map = map,
      );

      final infoWindow =
      InfoWindow(InfoWindowOptions()..content = contentString);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
      return elem;
    });

    return Scaffold(
      body: Stack(
        children: [
          HtmlElementView(viewType: htmlId),
          Positioned(
              top: 30,
              left: 20,
              child: Column(
                  children: [
                    const MapSearch(),
                    const SizedBox(height: 12),
                    const DemoDay(),
                    const SizedBox(height: 20),
                    Container(
                      height: 44,
                        width: 210,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff009A96),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)
                            )]
                        ),
                      child: const Text(
                        "Создать Demo day",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white
                        )
                      )
                    )
                  ]
              )
          )
        ]
      )
    );
  }
}

var  contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
    '<div id="bodyContent">' +
    '<p>Demo-day: Метрополитен</p>' +
    '</div>' +
    '</div>';