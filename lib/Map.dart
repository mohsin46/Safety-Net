import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading_animations/loading_animations.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  void navigation(String destination) {
    final AndroidIntent intent = new AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull("https://www.google.com/maps/dir/?api=1&origin=" +
            myLocation +
            "&destination=" +
            destination +
            "&travelmode=driving&dir_action=navigate"),
        package: 'com.google.android.apps.maps');
    intent.launch();
    print(Uri.encodeFull("https://www.google.com/maps/dir/?api=1&origin=" +
        "" +
        "&destination=" +
        myLocation +
        "&travelmode=driving&dir_action=navigate"));
  }

  LatLng currLocation; // = new LatLng(19.514750, 73.898891);
  String myLocation = "";
  Future<LatLng> _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      setState(() {
        currLocation = new LatLng(position.latitude, position.longitude);
        myLocation =
            position.latitude.toString() + "," + position.longitude.toString();
        print("My Location is $position");
      });
    }).catchError((e) {
      print(e);
    });
    return currLocation;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    // navigation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: FutureBuilder(
                future: _getCurrentLocation(),
                builder:
                    (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
                  if (currLocation != null) {
                    return FlutterMap(
                      options: new MapOptions(
                        center: currLocation,
                        zoom: 13.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']),
                        new MarkerLayerOptions(
                          markers: [
                            new Marker(
                              width: 30.0,
                              height: 30.0,
                              point: currLocation,
                              builder: (ctx) => new Container(
                                child: new Icon(Icons.place),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: LoadingFlipping.circle(
                          size: 40,
                        ),
                      ),
                    );
                  }
                }),
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_hospital,
                      size: 40,
                    ),
                    Text("Hospital")
                  ],
                ),
                onPressed: () async {
                  await _getCurrentLocation();
                  navigation("Open Hospitals Near Me");
                },
              ),
              FlatButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 40,
                      ),
                      Text("Police Station")
                    ],
                  ),
                  onPressed: () async {
                    _getCurrentLocation();
                    navigation("Police Station Near Me");
                  }),
              FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_atm,
                      size: 40,
                    ),
                    Text("ATM")
                  ],
                ),
                onPressed: () async {
                  await _getCurrentLocation();
                  navigation("ATM Near Me");
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
