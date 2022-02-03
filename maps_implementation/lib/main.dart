import 'package:flutter/material.dart';
import 'package:maps_implementation/maps.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Maps()));
          },
          icon: Icon(Icons.map),
        ),
      ),
    );
  }
}
