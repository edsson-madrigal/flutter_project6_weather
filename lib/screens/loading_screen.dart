// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project6_weather/screens/location_screen.dart';
import 'package:flutter_project6_weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print('me mori');
    }
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
