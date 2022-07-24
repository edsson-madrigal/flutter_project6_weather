// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Location {
  double? latitude;
  double? longitude;


  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      if (kDebugMode) {
        print(position);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
