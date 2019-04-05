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


  Future<bool> upload()async{
    bool successful;
    if(movingDetails.notNull()) {
      loading.add(true);
        await CloudFunctions.instance.call(
          functionName: "onInitialized", parameters: movingDetails.toJson())
          .then((a) {
        print("Successful");
          }).whenComplete(() {
         print("Successful");
         loading.add(false);
         return successful=true;
      }).catchError((e) {
        loading.add(false);
        print(e.toString());
        return successful = false;
      });
       print(successful);
    }
    else successful = false;
    print(successful.runtimeType);
  return successful;
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
