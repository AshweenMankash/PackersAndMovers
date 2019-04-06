
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreProvider {
  Firestore _fireStore = Firestore.instance;
  Future<FirebaseUser> _fireBaseUser = FirebaseAuth.instance.currentUser();

  Future<QuerySnapshot> getCurrentMovingData(String uid) async =>
      _fireStore.collection("work/$uid/currentMoving/").getDocuments();

  Future<QuerySnapshot> getPastMovingData(String uid) async =>
      _fireStore.collection("work/$uid/pastWork").getDocuments();

  Future<DocumentSnapshot> getProfile(String uid) {
    print(uid);
    return  _fireStore.document("Users/$uid").get();
  }}

