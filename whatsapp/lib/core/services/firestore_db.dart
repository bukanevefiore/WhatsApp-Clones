import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/models/conversations.dart';


class FirestoreDB {
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    // firestore query
    var referance=_firestore
        .collection('conversations')
        .where('members',arrayContains: userId);

    // query mizi conversation listemize çevirme
    // return tipimizi query snapshot a döndürme
    return referance.snapshots().map((list) =>
    list.docs.map((snapshot) => Conversation.fromSnapshot(snapshot)));
  }
}