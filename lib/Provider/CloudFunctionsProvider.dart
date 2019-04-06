
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class CloudFunctionProvider {
  CloudFunctions _cloudFunctions = CloudFunctions(app: FirebaseApp.instance);
  Future<FirebaseUser> _fireBaseUser = FirebaseAuth.instance.currentUser();

  initializeWork(String uid, var data) {

    return _cloudFunctions
        .call(functionName: "onInitialized", parameters: data)
        .whenComplete(() => "UPLOAD_COMPLETED")
        .catchError((e) => "ERROR");
  }
  confirmQuotation() {}
}
