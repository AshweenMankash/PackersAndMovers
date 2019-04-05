import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/Login/LoginFile.dart';

abstract class Database{
}


class FireBaseCloudFunctions{
  FireBaseCloudFunctions.initialize (var data){
    CloudFunctions.instance.call(functionName: "onInitialized",parameters:data);
  }





}


class FireStoreDatabase implements Database{
  Login login ;
  bool isLoggedIn;
  var uid;
  FireBaseCloudFunctions _fireBaseCloudFunctions;

  checkIfShyftingIsOn(){
    bool on;

     Firestore.instance
        .document("Users/$uid/")
        .snapshots().listen(((d)=>d.exists?on=d.data["isShyfting"]:on=false));
     print(on.toString()+"asdadasdasdads");
    return on;
  }
  FireStoreDatabase(){
    _fireBaseCloudFunctions = FireBaseCloudFunctions();
    isLoggedIn=false;
    login = Login();
    initialize();
    }


    initialize()async{
      isLoggedIn = await login.login();

      FirebaseAuth.instance.currentUser().then((u)async{
          if(u==null){
            isLoggedIn = await login.signIn();
          }
          else{
            isLoggedIn = true;
              this.uid = u.uid;
            _fireBaseCloudFunctions.isMovingOn(uid);
          }
        });
      }





    }







