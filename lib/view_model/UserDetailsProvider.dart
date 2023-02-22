import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/UserModel.dart';
import 'package:rentpayy/utils/utils.dart';

import '../resources/FirebaseRepository.dart';
import '../resources/StorageService.dart';

class UserDetailsProvider with ChangeNotifier {
  UserModel? userDetails;

  Future getUserLocally() async {

    userDetails = await StorageService.readUser();
    notifyListeners();
  }

  Future getHostelFromServer(String uid, context) async {
    final FirebaseRepository _firebaseRepository = FirebaseRepository();
    userDetails = await _firebaseRepository.getUserDetails(uid);
    if (userDetails == null)
      utils.flushBarErrorMessage("No user found", context);
    notifyListeners();
  }
}
