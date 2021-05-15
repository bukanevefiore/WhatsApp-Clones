import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/core/services/navigator_service.dart';
import 'package:whatsapp/screens/sign_in_page.dart';
import 'package:whatsapp/viewmodels/sign_in_model.dart';
import 'package:whatsapp/whatsapp_main.dart';

void main() {

  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (BuildContext context) => getIt<SignInModel>().currentUser,
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          primaryColor: Color(0xff075E54),
          accentColor: Color(0xff25D366),
        ),
        home: Consumer<User>(
          builder: (BuildContext context, User user, Widget child) =>
              user == null ? SignInPage() : WhatsAppMain(),
        ),
      ),
    );
  }
}

