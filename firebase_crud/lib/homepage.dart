import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Stream<QuerySnapshot> snapshotStream = firestore.collection('students').snapshots();
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'),centerTitle: true,),
      body: StreamBuilder<QuerySnapshot>(
        stream: snapshotStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['Name']),
                subtitle: Text(data['regNo']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
