import 'package:flutter/material.dart';

TextStyle kTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w900,
  color: Colors.white
);

class OutputPage extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  OutputPage({required this.name,required this.gender, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        color: Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                style: kTextStyle,
              ),
              Text(gender,
                style: kTextStyle,
              ),
              Text(age.toString(),
                style: kTextStyle,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
