import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/Login/LoginFile.dart';

abstract class Database{
}


class FireBaseCloudFunctions{
  FireBaseCloudFunctions.initialize (var data){
    CloudFunctions.instance.call(
        functionName: "onInitialized", parameters: data)
        .then((a) {
      print("Successful");
    }).whenComplete(() {
      print("Successful");

    }).catchError((e) {
      print(e.toString());
    });
  }
}


class FireStoreDatabase implements Database {
  Login login;

  bool isLoggedIn;

  var isShiftingOn;
  var uid;
  var movingData;
  checkIfShiftingIsOn() async {
    Firestore.instance
        .document("Users/$uid/")
        .snapshots().listen(((data) {
      isShiftingOn = data.exists ? data.data["isShyfting"] : false;
      print(isShiftingOn);
    }));
  }

  FireStoreDatabase() {
    isLoggedIn = false;
    login = Login();
    initialize();
  }

  initializeCurrentWork(var initializeCurrentWork) { FireBaseCloudFunctions.initialize(initializeCurrentWork); }

  initialize() async {
    isLoggedIn = await login.login();
    FirebaseAuth.instance.currentUser().then((u) async {
      if (u == null) {
        isLoggedIn = await login.signIn();
      }
      else {
        isLoggedIn = true;
        this.uid = u.uid;
      await checkIfShiftingIsOn();
      }
    });
  }
}