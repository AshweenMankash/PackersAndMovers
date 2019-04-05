import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/Model/HomePageModel.dart';
import 'package:shyft_packers_and_movers/Repository/Repository.dart';
import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';

class HomePageViewModel implements BLoc{
  StreamController<bool> isMovingOn = new StreamController.broadcast();
  HomePageModel homePageModel ;
  FireStoreDatabase _fireStoreDatabase;
  var uid;
  var dataExists = false;

  HomePageViewModel(){
    _fireStoreDatabase = FireStoreDatabase();
    isMovingOn.add(_fireStoreDatabase.checkIfShyftingIsOn());
  }

  @override
  void dispose() {
    isMovingOn.close();
  }
}

HomePageViewModel homePageViewModel = HomePageViewModel();