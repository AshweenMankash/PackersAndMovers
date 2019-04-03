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
  StreamController<bool> buttonStatus  = new StreamController.broadcast();

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


//  upload(){
////    CloudFunctions.instance.call(functionName: "setData",parameters: data.toJson());
//
//  }



  @override
  void dispose() {
    loading.close();
    buttonStatus.close();
  }
}
MovingServiceViewModel controller = new MovingServiceViewModel();
