import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/UserModel.dart';

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
}
