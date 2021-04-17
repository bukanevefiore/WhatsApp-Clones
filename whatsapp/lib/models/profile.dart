import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profile {
  String id;
  String userName;
  String image;

  Profile({this.id, this.userName, this.image});

  factory Profile.fromSnapshot(DocumentSnapshot snapshot)  {
    Firebase.initializeApp();
    return Profile(
      id: snapshot.id,
      userName: snapshot["userName"],
      image: snapshot["image"],
    );
  }
}