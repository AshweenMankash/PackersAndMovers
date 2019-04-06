import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/BLoc/BLOC.dart';
import 'package:shyft_packers_and_movers/Provider/FireStoreProvider.dart';

class MovingHomeStatusBloc extends BLoc{
  FireStoreProvider _fireStoreProvider;

  MovingHomeStatusBloc(){
    _fireStoreProvider = FireStoreProvider();
  }


  StreamController<bool> isLoading = StreamController.broadcast();

   Stream<bool> get load  => isLoading.stream;
   Stream<QuerySnapshot> get currentMovingData => FirebaseAuth.instance.currentUser().then((user)=>_fireStoreProvider.getCurrentMovingData(user.uid)).asStream();


  @override
  void dispose() {
    isLoading.close();
  }
}