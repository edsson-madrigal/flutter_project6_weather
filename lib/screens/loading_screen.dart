// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project6_weather/services/location.dart';
import 'package:flutter_project6_weather/utilities/constants.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

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
    latitude = location.latitude!;
    longitude = location.longitude!;
  }

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey'),
    );
    if (kDebugMode) {
      print(response.body);
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      // decodedData returns a dynamic type, only if you are sure the data type add it, otherwise use var
      double temperature = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];

      if (kDebugMode) {
        print(temperature);
        print(condition);
        print(cityName);
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
