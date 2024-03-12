import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app_romavic/core/services/firebase/auth_firebase_services.dart';

class AuthFirebaseServicesImpl implements AuthFirebaseServices {
  final FirebaseAuth firebaseAuth;

  AuthFirebaseServicesImpl({
    required this.firebaseAuth,
  });

  @override
  Future<UserCredential> getLoginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
