import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/core/services/auth_service.dart';
import 'package:whatsapp/core/services/navigator_service.dart';

abstract class BaseModel with ChangeNotifier{

  final AuthService authService = getIt<AuthService>();

  final NavigatorService navigatorService = getIt<NavigatorService>();

  // login olma için dinleme
  bool _busy=false;

  bool get busy => _busy;

  set busy(bool state) {
    _busy=state;

    notifyListeners();
  }

  User get currentUser => authService.currentUser;

  void goBack(){
    Firebase.initializeApp();
    navigatorService.pop();
  }
}