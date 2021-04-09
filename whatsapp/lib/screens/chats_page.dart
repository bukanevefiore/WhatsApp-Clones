import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/screens/conversation_page.dart';

class ChatsPage extends StatelessWidget {
  final String userId="wnX1EbZWkEgAIvkrdFdaxGx4JQF2";
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();  // gerekli
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('conversations')
          .where('members',arrayContains: userId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.tealAccent));
          //return Text('Loading...');
        }
        return ListView(
          children: snapshot.data.docs
              .map((doc) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://placekitten.com/200/200"),
                    ),
                    title: Text('Dali'),
                    subtitle: Text(doc['displayMessage']),
                    trailing: Column(
                      children: <Widget>[Text("19:30"),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).accentColor),
                          child: Center(
                            child: Text(
                              "16",
                              textScaleFactor: 0.8,
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                     ),
                     onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (content) =>
                          ConversationPage(
                            userId: userId,
                            conversationId: doc.id,
                          )));
                     },
                   ))
              .toList(),
        );
      },
    );
  }
}
