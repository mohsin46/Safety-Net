import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safety_net/Authorized.dart';
import 'package:safety_net/Login.dart';
import 'package:safety_net/Map.dart';
import 'ContactsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/second',
      routes: {
        '/': (context) => LoginPage(),
        '/second': (context) => Authorized(),
        '/contacts': (context) => ContactsPage(),
      },
      // home: Authorized(),
      title: 'Safety Net',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
