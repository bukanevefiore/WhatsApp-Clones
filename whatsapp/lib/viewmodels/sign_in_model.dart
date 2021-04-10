

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/core/services/auth_service.dart';
import 'package:whatsapp/viewmodels/base_model.dart';

class SignInModel extends BaseModel{

  final AuthService _authService=getIt<AuthService>();
  final FirebaseFirestore _firestore=FirebaseFirestore.instance; //kullanıcı profili açmak için

  Future<void> signIn(String userName) async {
    if(userName.isNotEmpty) return;

    busy=true;

    try {
      var user=await _authService.signIn();

      await _firestore.collection('profile').doc(user.uid).set(
        {'userName': userName,'image': 'https://placekitten.com/200/200'}
      );

    }catch(e) {
      busy = false;
    }

    busy=false;
  }

}