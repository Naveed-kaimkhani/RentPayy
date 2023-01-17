import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/utils/utils.dart';
import '../utils/style/AppColors.dart';
import '../utils/style/Images.dart';

class upper_design extends StatelessWidget implements PreferredSizeWidget {
upper_design({
    required this.needcolor,
    required this.needicon,
    required this.isUserDelete,
    Key? key,
  }) : super(key: key);

  bool needcolor = false;
  bool needicon = false;
  bool isUserDelete = false;
  FirebaseFirestore db = utils.getFireStoreInstance();
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor:
            needcolor ? AppColors.primaryColor : Colors.transparent,
        leading: needicon
            ? IconButton(
                onPressed: (() async {
                  if (isUserDelete) {
                    await db.collection("hostels").doc(utils.getCurrentUserUid()).delete();
                    utils.getCurrentUser().delete();
                    Navigator.pop(context);
                  }
                  else
                    Navigator.pop(context);
                }),
                icon: hostel_appBarButton(Buttoncolor: Colors.white, IconUrl: Images.yellowBackIcon),
              )
            : null);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
