import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();  // gerekli
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('whats').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        if(snapshot.connectionState != ConnectionState.waiting){
          //return Center(child: CircularProgressIndicator(backgroundColor: Colors.tealAccent));
          return Text('Loading...');
        }
        return ListView(
          children: snapshot.data.docs
              .map((doc) => ListTile(
                    title: Text(doc['name']),
                    subtitle: Text(doc['message']),
                   ))
              .toList(),
        );
      },
    );
  }
}
