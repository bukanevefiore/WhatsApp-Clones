import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void pop() {
    Firebase.initializeApp();
    _navigatorKey.currentState.pop();
  }

  Future<dynamic> navigateTo(Widget route) {
    Firebase.initializeApp();
    return _navigatorKey.currentState
        .push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  Future<dynamic> navigateAndReplace(Widget route) {
    Firebase.initializeApp();
    return _navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (BuildContext context) => route));
  }


}