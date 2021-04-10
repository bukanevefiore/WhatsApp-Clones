import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/viewmodels/sign_in_model.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GetIt.instance<SignInModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign In Whatsapp'),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 40,right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "User Name",
              ),
            ),
            RaisedButton(
              child: Text('Sign In'),
                onPressed: () {},
            ),
          ],),
        ),
      ),
    );
  }
}
