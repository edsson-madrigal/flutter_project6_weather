// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
