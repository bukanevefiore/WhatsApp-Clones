import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/screens/sign_in_page.dart';
import 'package:whatsapp/whatsapp_main.dart';

void main() {

  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      home: SignInPage(),
    );
  }
}

