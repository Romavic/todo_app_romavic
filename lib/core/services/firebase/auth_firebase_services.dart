import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseServices {
  Future<UserCredential> getLoginWithGoogle();
}