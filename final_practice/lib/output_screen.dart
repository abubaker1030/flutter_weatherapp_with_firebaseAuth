import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key}) : super(key: key);
  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  double lat = 0;
  double lon = 0;
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      lon = position.longitude;
    });
  }
  @override
  void initState() {
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(lat.toStringAsFixed(3) + '\n' + lon.toStringAsFixed(3)),
      ),
    );
  }
}
