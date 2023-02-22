import 'package:flutter/cupertino.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/utils/utils.dart';
import '../resources/FirebaseRepository.dart';
import '../utils/StorageServiceHostel.dart';
import '../utils/routes/RoutesName.dart';

class HostelDetailsProvider with ChangeNotifier {
  hostelModel? hostelDetails;
  Future getHostelLocally() async {
    hostelDetails = await StorageServiceHostel.readHostel();
    notifyListeners();
  }

  Future<hostelModel?> getHostelFromServer(String uid, context) async {
    final FirebaseRepository _firebaseRepository = FirebaseRepository();
    hostelDetails = await _firebaseRepository.getHostelDetails(
      uid,
    );
    if (hostelDetails == null) {
      utils.flushBarErrorMessage("No user found", context);
    } else {
      return hostelDetails;
      // Navigator.pushNamed(context, RoutesName.SellerDashboard);
    }
  }
}
