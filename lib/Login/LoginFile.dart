import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shyft_packers_and_movers/Repository/Repository.dart';

class Login{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login(){
    var user = FirebaseAuth.instance.currentUser();
    print("user");
    return user?.then((u){
      print("this is ${u?.toString()}");
      if(u==null){
       return false;
      }
      return true;
    });

  }

   signIn()async{
    final GoogleSignInAccount user = await _googleSignIn.signIn().then((G){
    return G;
    }).catchError((e){
        print("Not Logged In");
      }).whenComplete((){
    });

    final GoogleSignInAuthentication auth = await user.authentication;
    final AuthCredential credential =GoogleAuthProvider.getCredential(idToken: auth.idToken, accessToken: auth.accessToken);
    final FirebaseUser Fuser = await _auth.signInWithCredential(credential);
    return false;
  }
}