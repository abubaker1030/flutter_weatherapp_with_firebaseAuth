import 'package:flutter/material.dart';
import 'package:task/output.dart';

void main() {
  runApp(
    MaterialApp(
      home: InputPage(),
    ),
  );
}

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  TextEditingController nameController = TextEditingController();
  Gender? selectedGender;
  int age = 18;
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: TextField(
                maxLength: 30,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                          gender = "Male";
                        });
                      },
                      child: MyCard(
                        cardColor: selectedGender==Gender.male?Colors.lightBlue:Colors.lightBlueAccent,

                        gender: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                          gender = "Female";
                        });
                      },
                      child: MyCard(
                        cardColor: selectedGender==Gender.female?Colors.lightBlue:Colors.lightBlueAccent,
                        gender: 'Female',
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(age.toStringAsFixed(0),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text('Age',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                              activeTrackColor: Colors.white,
                              thumbColor: Colors.lightBlue,
                              overlayColor: Colors.lightBlueAccent),
                          child: Expanded(
                            child: Slider(
                                inactiveColor: Color(0xFF8D8E98),
                                value: age.toDouble(),
                                min: 10,
                                max: 100,
                                onChanged: (val) {
                                  setState(() {
                                    age = val.toInt();
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputPage(name: nameController.text, gender: gender, age: age)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text("Save",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({required this.cardColor,required this.gender});

  final Color cardColor;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(child: Text(gender,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
      ),),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}



