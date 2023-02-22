import 'dart:io';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    getData(latitude, longitude);
  }

  void getData(double latitude, double longitude) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$latitude%2C%20$longitude?unitGroup=metric&key=HJULVPDK7GB24E6MDR5TJ9Q9V&contentType=json',
      ),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
