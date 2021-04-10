import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/viewmodels/sign_in_model.dart';


class SignInPage extends StatelessWidget {

  const SignInPage({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();  // gerekli
    var model=GetIt.instance<SignInModel>();
    final TextEditingController editingController=TextEditingController();

    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: Consumer<SignInModel>(
          builder: (BuildContext context,SignInModel model,Widget child) => Scaffold(
            appBar: AppBar(
              title: Text('Sign In Whatsapp'),
            ),
            body: Container(
              margin: EdgeInsets.only(left: 40,right: 40),
              child: model.busy
                  ? CircularProgressIndicator()
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: editingController,
                    decoration: InputDecoration(
                      hintText: "User Name",
                    ),
                  ),
                  RaisedButton(
                    child: Text('Sign In'),
                    onPressed: () async => await model.signIn(editingController.text),
                  ),
                ],),
            ),
          ),
      ),
    );
  }
}
