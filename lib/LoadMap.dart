// import 'package:flutter/material.dart';
// import 'package:latlong/latlong.dart';
// import 'package:loading_animations/loading_animations.dart';
// import 'package:safety_net/Map.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   Position _currentPosition;
//   LatLng latLng;
//   _getCurrentLocation() async {
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//         latLng = new LatLng(position.latitude, position.longitude);
//         print("My Location is $position");
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return MyMap(
//             currLocation: latLng,
//           );
//         }));
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: Center(
//         child: LoadingFadingLine.circle(
//           size: 30,
//           backgroundColor: Colors.white,
//         ),
//       ),
//     ));
//   }
// }
