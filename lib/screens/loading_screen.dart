// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project6_weather/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print('me mori');
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    if (kDebugMode) {
      print(location.latitude);
      print(location.latitude);
    }
  }

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'),
    );
    if (kDebugMode) {
      print(response.body);
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      String data = response.body;
      var lon = jsonDecode(data)['coord']['lon'];
      var descr = jsonDecode(data)['weather'][0].description;

      if (kDebugMode) {
        print(lon);
        print(descr);
      }
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
