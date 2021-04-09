

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;

  const ConversationPage({Key key, this.userId, this.conversationId})
      : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {

  final TextEditingController _editingController=TextEditingController();
  CollectionReference _reference;

  @override
  void initState() {
    _reference = FirebaseFirestore.instance
        .collection('conversations/${widget.conversationId}/messages');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("https://placekitten.com/200/200"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Deren Derin"),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Icon(Icons.phone), onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Icon(Icons.camera_alt), onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Icon(Icons.more_vert), onTap: () {}),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://placekitten.com/600/800"),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: _reference.orderBy('timeStamp').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return !snapshot.hasData
                        ? CircularProgressIndicator()
                        : ListView(
                            children: snapshot.data.docs.map((document) => ListTile(
                                  title: Align(
                                    alignment:
                                        widget.userId != document['senderId']
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10),
                                              right: Radius.circular(10))),
                                      child: Text(
                                        document['message'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                            ).toList(),
                          );
                  }),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(25),
                          right: Radius.circular(25)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(Icons.tag_faces, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _editingController,
                            decoration: InputDecoration(
                              hintText: "Type a message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Icon(Icons.attach_file, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(Icons.camera_alt, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () async {
                     await _reference.add({
                       'senderId': widget.userId,
                       'message': _editingController.text,
                       'timeStamp': DateTime.now(),
                     });
                     _editingController.text='';
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
