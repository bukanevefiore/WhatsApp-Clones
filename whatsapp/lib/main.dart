import 'package:flutter/material.dart';
import 'file:///C:/src/projeler/WhatsApp-Clones/whatsapp/lib/core/services/locator.dart';
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
      home: WhatsAppMain(),
    );
  }
}

