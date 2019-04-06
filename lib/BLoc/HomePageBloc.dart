
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shyft_packers_and_movers/BLoc/BLOC.dart';
import 'package:shyft_packers_and_movers/Provider/FireStoreProvider.dart';

class HomePageBloc extends BLoc {
  FireStoreProvider _fireStoreProvider = FireStoreProvider();

  personProfile() {
    return FirebaseAuth.instance.currentUser()
        .then((user) => _fireStoreProvider.getProfile(user.uid))
        .asStream();
  }

  getCurrentMovingData() {
    return FirebaseAuth.instance.currentUser()
        .then((user) => _fireStoreProvider.getCurrentMovingData(user.uid))
        .asStream();
  }

  getPastMovingData() {
    return FirebaseAuth.instance.currentUser()
        .then((user) => _fireStoreProvider.getPastMovingData(user.uid))
        .asStream();
  }

  moving() {
    return FirebaseAuth.instance.currentUser()
        .then((user) =>
        _fireStoreProvider.getProfile(user.uid).then(
                (profile) =>
            profile.data["isShyfting"]
        ))
        .asStream();
  }
  @override
  void dispose() {}
}