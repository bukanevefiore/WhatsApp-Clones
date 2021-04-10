import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  // ananim olarak kişileri sisteme login etme
  Future<User> signIn() async {
    var user= await _firebaseAuth.signInAnonymously();

    return user.user;
  }
}