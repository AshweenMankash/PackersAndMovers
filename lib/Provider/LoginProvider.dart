
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOut()async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  signIn() async {
    final GoogleSignInAccount user = await _googleSignIn
        .signIn()
        .catchError((e) => print("Not Logged In"))
        .whenComplete(() {});
    if (user == null) {
      signIn();
    } else {
      final GoogleSignInAuthentication auth = await user.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: auth.idToken, accessToken: auth.accessToken);
      final FirebaseUser Fuser = await _auth.signInWithCredential(credential);
    }
  }
}
