import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/Login/LoginFile.dart';

abstract class Database{
}


class FirebaseDatabase implements Database{
  Login login = new Login();
  bool isLoggedIn;
  isMovingOn (String uid){
   CloudFunctions.instance.call(functionName: "isShyfting",parameters:{"uid":uid}).then((a){
    print("hello this is $a");
  });
    }


  FirebaseDatabase(){
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
            isMovingOn(u.uid);
          }
        });
      }

    }


