import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp/models/conversations.dart';
import 'package:whatsapp/models/profile.dart';

// sohpetler
class ChatService {
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    // firestore query
    var referance=_firestore
        .collection('conversations')
        .where('members',arrayContains: userId);

    Firebase.initializeApp();  // eklenmeli
    // query mizi conversation listemize çevirme
    // return tipimizi query snapshot a döndürme
    return referance.snapshots().map((list) =>
    list.docs.map((snapshot) => Conversation.fromSnapshot(snapshot))
    .toList());
  }

  Future<List<Profile>> getContacts() async {
    var referance = _firestore.collection("profile");

    var documents = await referance.get();

    return documents.docs
        .map((snapshot) => Profile.fromSnapshot(snapshot))
        .toList();
  }
}