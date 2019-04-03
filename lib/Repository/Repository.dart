import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Database{
}


class FirebaseDatabase implements Database{
  isMovingOn (String uid){
   CloudFunctions.instance.call(functionName: "isShyfting",parameters:{"uid":uid}).then((a){
    print("hello this is $a");
  });
    }


  FirebaseDatabase(){
  FirebaseAuth.instance.currentUser().then((u){
    print(u.uid);
    isMovingOn(u.uid);
  });
  }


}