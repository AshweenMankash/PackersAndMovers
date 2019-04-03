import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';

abstract class BLoc{
  void dispose();
}


class MovingServiceViewModel implements BLoc{

  MovingServiceModel movingDetails ;
  StreamController<bool> loading  = new StreamController() ;

  MovingServiceViewModel(){
    movingDetails = new MovingServiceModel();

  }


  upload(){
    loading.add(true);
    CloudFunctions.instance.call(functionName: "setData",parameters: movingDetails.toJson()).whenComplete((){
      loading.add(false);
    }).catchError((e){
      loading.add(false);
      print(e.toString());
    });
  }
  Observable lol ;

  @override
  void dispose() {
    loading.close();
  }
}