import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/models/conversations.dart';
import 'package:whatsapp/screens/conversation_page.dart';
import 'package:whatsapp/viewmodels/chats_model.dart';

class ChatsPage extends StatelessWidget {
  final String userId="wnX1EbZWkEgAIvkrdFdaxGx4JQF2";
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();  // gerekli
    var model=GetIt.instance<ChatsModel>();

    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: StreamBuilder<List<Conversation>>(
        stream: model.conversations(userId),
        builder: (BuildContext context, AsyncSnapshot<List<Conversation>> snapshot) {
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.tealAccent));
            //return Text('Loading...');
          }
          return ListView(
            children: snapshot.data
                .map((doc) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(doc.profileImage),
                      ),
                      title: Text(doc.name),
                      subtitle: Text(doc.displayMessage),
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
      ),
    );
  }
}
