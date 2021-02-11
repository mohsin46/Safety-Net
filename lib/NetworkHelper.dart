import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  String auth;
  String id;

  NetworkHelper(String url, String auth, String id) {
    this.url = url;
    this.auth = auth;
    this.id = id;
  }

  Future startTracing() async {
    http.Response response = await http.post('$url/devices/$id/start',
        body: null, headers: {'Authorization': auth});
    if (response.statusCode == 200) {
      String data = response.body;
      print("MY LOCATION RESPONSEEEEEEEEEEEEEEE");
      print(response.body);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getData() async {
    http.Response response =
        await http.get('$url/devices/$id', headers: {'Authorization': auth});
    print("GETTING DATA");
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print("ERROR IN GETTING");
      print(response.statusCode);
    }
  }

  Future endTracing() async {
    http.Response response = await http.post('$url/devices/$id/stop',
        body: null, headers: {'Authorization': auth});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
