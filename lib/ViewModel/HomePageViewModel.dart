import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/Model/HomePageModel.dart';
import 'package:shyft_packers_and_movers/Repository/Repository.dart';
import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';

class HomePageViewModel implements BLoc{
  StreamController<bool> isMovingOn = new StreamController.broadcast();
  StreamController<bool> isLoading = new StreamController.broadcast();
  HomePageModel homePageModel ;
  FireStoreDatabase _fireStoreDatabase;
  var uid;
  var dataExists = false;

  HomePageViewModel(){
    _fireStoreDatabase = FireStoreDatabase();
    fetch();
    isLoading.add(false);
  }

fetch(){
     isMovingOn.add(_fireStoreDatabase.isShiftingOn);
  }


  @override
  void dispose() {
    isMovingOn.close();
    isLoading.close();
  }
}

HomePageViewModel homePageViewModel ;