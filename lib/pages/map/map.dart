import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:stinger_web/components/my_button.dart';
import 'package:stinger_web/components/my_snackbar.dart';
import 'dart:ui' as ui;

import '../../constants.dart';
import 'demo_day.dart';
import 'map_search.dart';

/**
 * Карта встреч
 */
class GoogleMap extends StatefulWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
      marker.onClick.listen((event) {
        setState(() => showInfo = !showInfo);
        infoWindow.open(map, marker);
      });
      return elem;
    });

    _showModalBottomSheet(context) {
      showModalBottomSheet(
        backgroundColor: Colors.grey.withOpacity(0.2),
        isScrollControlled: true,
        context: context,
        builder: (_) {
          textArea(String title, String tip, bool required,
                  TextEditingController controller) =>
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: FittedBox(
                              child: Text(title,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500))),
                        ),
                        required
                            ? const Text('*',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18))
                            : Container()
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                          color: textField,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        controller: controller,
                        cursorColor: text,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                          hintText: tip,
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: semiText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
          TextEditingController nameController = TextEditingController();
          TextEditingController stageController = TextEditingController();
          TextEditingController descrController = TextEditingController();
          sendDemoDay() {
            MySnackbar.show(context, 'Встреча создана');
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 600,
                  height: 550,
                  child: Column(
                    children: [
                      const Text(
                        'Загрузка проекта',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      textArea('Тематика', 'Введите название тематики', true,
                          nameController),
                      textArea(
                          'Место',
                          'Выбирите место на карте, или впигите адрес',
                          true,
                          stageController),
                      textArea(
                          'Дата и время', 'Во сколько?', true, descrController),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: MyGreenButton(
                          txt: 'Организовать',
                          onTap: () {
                            Navigator.of(context).pop();
                            sendDemoDay();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
        body: Stack(children: [
      HtmlElementView(viewType: htmlId),
      Positioned(
          top: 30,
          left: 20,
          child: AnimatedOpacity(
              opacity: showInfo ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Column(children: [
                const MapSearch(),
                const SizedBox(height: 12),
                const DemoDay(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _showModalBottomSheet(context);
                  },
                  child: Container(
                      height: 44,
                      width: 210,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff009A96),
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.1))
                          ]),
                      child: const Text("Создать Demo day",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white))),
                )
              ])))
    ]));
  }
}

var contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
    '<div id="bodyContent">' +
    '<p>Demo-day: Метрополитен</p>' +
    '</div>' +
    '</div>';
