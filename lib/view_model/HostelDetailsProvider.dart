import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/utils.dart';
import '../resources/FirebaseRepository.dart';
import '../utils/StorageServiceHostel.dart';


class HostelDetailsProvider with ChangeNotifier{
  hostelModel? hostelDetails;
  // UserDetailsProvider():userDetails=UserModwe(name: "Loading", phone: "Loading");

  Future getHostelLocally() async {
    // userDetails = await Firestore_method().getNameAndAddress();
    hostelDetails =await StorageServiceHostel.readHostel();
    notifyListeners();
  }

  Future getHostelFromServer(String uid,context) async {
    print("getHostelFromServer");
    // userDetails = await Firestore_method().getNameAndAddress();
      final FirebaseRepository _firebaseRepository = FirebaseRepository();
    // hostelDetails =await StorageServiceHostel.readHostel();
    hostelDetails =await _firebaseRepository.getHostelDetails(uid);
    print("after calling getHostelDetails");
    print(hostelDetails);
    if (hostelDetails==null)utils.flushBarErrorMessage("No user found",context);
    notifyListeners();
  }
  
}