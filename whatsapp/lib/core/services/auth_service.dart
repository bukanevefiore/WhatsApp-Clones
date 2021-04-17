import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  User get currentUser => _firebaseAuth.currentUser;
  // ananim olarak kişileri sisteme login etme
  Future<User> signIn() async {
    var user= await _firebaseAuth.signInAnonymously();

    Firebase.initializeApp();  // eklenmeli
    return user.user;
  }
}