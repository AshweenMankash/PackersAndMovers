import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shyft_packers_and_movers/BLoc/BLOC.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';
import 'package:shyft_packers_and_movers/Provider/CloudFunctionsProvider.dart';
import 'package:shyft_packers_and_movers/Validator/Validator.dart';

class MovingServiceBloc extends BLoc with Validators {
  CloudFunctionProvider _cloudFunctionProvider = CloudFunctionProvider();

  MovingServiceBloc() {
    isLoading.add(true);
    pickUpAddressController.add("");
    dropAddressController.add("");
    dateController.add(DateTime.now().add(Duration(days: 1)));
    surveyTimeController.add("Afternoon");
    isLoading.add(false);
  }

  final pickUpAddressController = BehaviorSubject<String>();
  final dropAddressController = BehaviorSubject<String>();
  final dateController = BehaviorSubject<DateTime>();
  final surveyTimeController = BehaviorSubject<String>();
  final isLoading = BehaviorSubject<bool>();

  Stream<String> get getPickUp =>
      pickUpAddressController.stream.transform(addressValidators);

  Stream<String> get getDrop =>
      dropAddressController.stream.transform(addressValidators);

  Stream<String> get getSurveyTime => surveyTimeController.stream;

  Stream<DateTime> get getDate => dateController.stream;

  Function(String) get setDrop => dropAddressController.sink.add;

  Function(DateTime) get setDate => dateController.sink.add;

  Function(String) get setPickUp => pickUpAddressController.sink.add;

  Function(String) get setSurveyTime => surveyTimeController.sink.add;

  Stream<bool> get load => isLoading.stream;

  Future<bool> requestMovers() async {
    isLoading.add(true);
    MovingServiceModel movingServiceModel = MovingServiceModel();
    movingServiceModel.pickUpAddress = pickUpAddressController.value;
    movingServiceModel.dropAddress = dropAddressController.value;
    movingServiceModel.date = dateController.value;
    movingServiceModel.surveyTime = surveyTimeController.value;

    if (movingServiceModel.notNull()) {
      return FirebaseAuth.instance
          .currentUser()
          .then((user){
        _cloudFunctionProvider.initializeWork(
            user.uid, movingServiceModel.toJson());
        isLoading.add(false);
        return true;
      })
          .whenComplete(() {
        isLoading.add(false);
        return true;
      }).catchError((e){
        isLoading.add(false);
        return false;
      });
    } else {
      isLoading.add(false);
      return false;
    }
  }

  @override
  void dispose() {
    isLoading.close();
    pickUpAddressController.close();
    dropAddressController.close();
    dateController.close();
    surveyTimeController.close();
  }
}