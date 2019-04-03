import 'dart:async';

import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';

class HomePageViewModel implements BLoc{
  StreamController<bool> isMovingOn = new StreamController.broadcast();




  @override
  void dispose() {
    isMovingOn.close();
  }
}