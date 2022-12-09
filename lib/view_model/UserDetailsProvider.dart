import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/UserModel.dart';


class UserDetailsProvider with ChangeNotifier{
  UserModel? userDetails;
  // UserDetailsProvider():userDetails=UserModwe(name: "Loading", phone: "Loading");

  Future getData() async {
    // userDetails = await Firestore_method().getNameAndAddress();
    notifyListeners();
  }
  
}