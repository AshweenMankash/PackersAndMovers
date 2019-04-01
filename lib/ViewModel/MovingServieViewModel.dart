import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';

abstract class BLoc{
  void dispose();
}


class MovingServiceViewModel implements BLoc{

  StreamController<MovingServiceModel> movingDetails  = new StreamController();
  StreamController<bool> loading  = new StreamController() ;



  Observable lol ;

  @override
  void dispose() {
    movingDetails.close();
    loading.close();
  }
}