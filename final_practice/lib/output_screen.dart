import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key}) : super(key: key);
  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  double lat = 0;
  double lon = 0;
  double temp = 0;
  double windSpeed = 0;
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      lon = position.longitude;
    });
  }

  void getWeatherData() async{
    String api_key = "97df01b6453f1cd1e52e5a300c172cb2";
    String url = "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$api_key";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var weatherData = jsonDecode(response.body);
      setState(() {
        temp = weatherData['main']['temp']-273;
        windSpeed = weatherData['wind']['speed'];
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getLocation();
    getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(temp.toStringAsFixed(0) + '\n' + windSpeed.toStringAsFixed(3)),
      ),
    );
  }
}
