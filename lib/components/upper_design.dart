import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';

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
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
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
                    await db.collection("hostels").doc(user!.uid).delete();
                    user?.delete();
                    Navigator.pop(context);
                    print(user);
                  }
                  else
                    Navigator.pop(context);
                }),
                icon: hostel_appBarButton(Buttoncolor: Colors.white, IconUrl: Images.yellowBackIcon),
                //   // SvgPicture.asset('asset/backIcon.png')
              )
            : null);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
