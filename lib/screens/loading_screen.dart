// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project6_weather/services/location.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
