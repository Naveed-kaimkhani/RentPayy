import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/UserModel.dart';
import 'package:rentpayy/utils/utils.dart';

import '../resources/FirebaseRepository.dart';
import '../resources/StorageService.dart';

class UserDetailsProvider with ChangeNotifier {
  UserModel? userDetails;
  // UserDetailsProvider():userDetails=UserModwe(name: "Loading", phone: "Loading");

  Future getUserLocally() async {
    // userDetails = await Firestore_method().getNameAndAddress();

    userDetails = await StorageService.readUser();
    notifyListeners();

    print(userDetails);
    print(userDetails!.name);
    // return userDetails;
  }

  // UserModel? getUserLocally()  {
  //   // userDetails = await Firestore_method().getNameAndAddress();

  //   userDetails = await StorageService.readUser();
  //   notifyListeners();

  //   print(userDetails);
  //   print(userDetails!.name);
  //   return userDetails;
  // }

  Future getHostelFromServer(String uid, context) async {
    print("getHostelFromServer");
    final FirebaseRepository _firebaseRepository = FirebaseRepository();
    userDetails = await _firebaseRepository.getUserDetails(uid);
    if (userDetails == null)
      utils.flushBarErrorMessage("No user found", context);
    notifyListeners();
  }
}
