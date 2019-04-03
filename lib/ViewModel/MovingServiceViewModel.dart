import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';

abstract class BLoc{
  void dispose();
}


class MovingServiceViewModel implements BLoc{

  StreamController<MovingServiceModel> movingDetails  = new StreamController.broadcast();
  StreamController<bool> loading  = new StreamController() ;
  StreamController<bool> buttonStatus  = new StreamController.broadcast() ;



  Observable lol ;
  MovingServiceViewModel(){
    movingDetails.stream.listen((data){

    });
  }


//  upload(){
////    CloudFunctions.instance.call(functionName: "setData",parameters: data.toJson());
//
//  }



  @override
  void dispose() {
    movingDetails.close();
    loading.close();
    buttonStatus.close();
  }
}
MovingServiceViewModel controller = new MovingServiceViewModel();
