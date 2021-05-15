

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/core/services/auth_service.dart';
import 'package:whatsapp/core/services/navigator_service.dart';
import 'package:whatsapp/viewmodels/base_model.dart';
import 'package:whatsapp/whatsapp_main.dart';

class SignInModel extends BaseModel{

  final AuthService _authService=getIt<AuthService>();
  final FirebaseFirestore _firestore=FirebaseFirestore.instance; //kullanıcı profili açmak için

  Future<User> get currentUser => _authService.currentUser;

  Future<void> signIn(String userName) async {
    if(userName.isNotEmpty) return;

    busy=true;

    try {
      Firebase.initializeApp();
      var user=await _authService.signIn();

      await _firestore.collection('profile').doc(user.uid).set(
        {'userName': userName,'image': 'https://placekitten.com/200/200'});

      await navigatorService.navigateAndReplace(WhatsAppMain());

    }catch(e) {
      busy = false;
    }

    busy=false;
  }

}