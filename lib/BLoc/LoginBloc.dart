import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/BLoc/BLOC.dart';
import 'package:shyft_packers_and_movers/Provider/LoginProvider.dart';

class LoginBloc extends BLoc {
  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  LoginProvider _loginProvider = LoginProvider();

  signIn() {
    _loginProvider.signIn();
  }

  signOut() {
    _loginProvider.signOut();
  }

  Future<FirebaseUser> get getUser => _fireBaseAuth.currentUser();

  Stream<FirebaseUser> get getAuthState => _fireBaseAuth.onAuthStateChanged;

  @override
  void dispose() {}
}
