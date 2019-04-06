import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';

class HomePageModel{
  MovingServiceModel movingServiceModel;
  Map<String,int> items={};
  Map<String,double> quotation={};
  double total=0;


  HomePageModel(var movingServiceJson){
    movingServiceModel = MovingServiceModel.fromJson(movingServiceJson);
  }

}

