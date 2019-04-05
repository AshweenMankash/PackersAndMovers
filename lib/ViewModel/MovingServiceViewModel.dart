import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';
import 'package:shyft_packers_and_movers/Repository/Repository.dart';

abstract class BLoc{
  void dispose();
}


class MovingServiceViewModel implements BLoc{
  FireStoreDatabase fireStoreDatabase;
  MovingServiceModel movingDetails ;
  StreamController<bool> loading  = new StreamController() ;
  StreamController<bool> buttonStatus  = new StreamController.broadcast();

  MovingServiceViewModel(){
    movingDetails = new MovingServiceModel();
    fireStoreDatabase = FireStoreDatabase();
  }


  Future<bool> upload()async{
    bool successful;
    if(movingDetails.notNull()) {
      loading.add(true);
        fireStoreDatabase.initializeCurrentWork(movingDetails.toJson());
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
