import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/utils.dart';
import '../resources/FirebaseRepository.dart';
import '../utils/StorageServiceHostel.dart';
class HostelDetailsProvider with ChangeNotifier{
  hostelModel? hostelDetails;
  Future getHostelLocally() async {
    hostelDetails =await StorageServiceHostel.readHostel();
   print(hostelDetails!.name);
    notifyListeners();
  }
  Future getHostelFromServer(String uid,context) async {
    print("getHostelFromServer");
      final FirebaseRepository _firebaseRepository = FirebaseRepository();
    hostelDetails =await _firebaseRepository.getHostelDetails(uid);
    print("after calling getHostelDetails");
    print(hostelDetails);
    if (hostelDetails==null)utils.flushBarErrorMessage("No user found",context);
    notifyListeners();
  }
  
}