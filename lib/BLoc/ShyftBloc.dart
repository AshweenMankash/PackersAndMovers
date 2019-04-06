
import 'package:shyft_packers_and_movers/BLoc/BLOC.dart';
import 'package:shyft_packers_and_movers/BLoc/HomePageBloc.dart';
import 'package:shyft_packers_and_movers/BLoc/LoginBloc.dart';
import 'package:shyft_packers_and_movers/BLoc/MovingHomeStatusBLoc.dart';
import 'package:shyft_packers_and_movers/BLoc/MovingServiceBloc.dart';

class ShyftBLoc extends BLoc {
  LoginBloc loginBloc ;
  HomePageBloc homePageBloc ;
  MovingServiceBloc movingServiceBloc;
  MovingHomeStatusBloc movingHomeStatusBLoc;

  ShyftBLoc(){
    loginBloc = LoginBloc();
    homePageBloc = HomePageBloc();
    movingServiceBloc = MovingServiceBloc();
    movingHomeStatusBLoc = MovingHomeStatusBloc();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    loginBloc.dispose();
    homePageBloc.dispose();
    movingServiceBloc.dispose();
  }
}
