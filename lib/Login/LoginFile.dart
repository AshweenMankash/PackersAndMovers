import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Login(){
    var user = FirebaseAuth.instance.currentUser();
    print("user");
    user?.then((u){
      print("this is ${u?.toString()}");
      if(u?.uid==null){
       signIn();
      }
    });
  }

  signIn()async{
    final GoogleSignInAccount user = await _googleSignIn.signIn().then((G){
      if(G==null){
        signIn();

      }
      else
        return G;
    });

    if(user==null) return null;
    final GoogleSignInAuthentication auth = await user.authentication;

    final AuthCredential credential =GoogleAuthProvider.getCredential(idToken: auth.idToken, accessToken: auth.accessToken);
    final FirebaseUser Fuser = await _auth.signInWithCredential(credential);
    print("SignedIn With ${Fuser.displayName}");
  }
}