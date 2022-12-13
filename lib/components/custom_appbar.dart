import 'package:flutter/material.dart';
import 'package:rentpayy/utils/style/Images.dart';

import '../utils/style/AppColors.dart';
import 'hostel_appBarButton.dart';

class custom_appbar extends StatelessWidget implements PreferredSizeWidget {
  const custom_appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        onPressed: (() => Navigator.pop(context)),
        icon: hostel_appBarButton(
          Buttoncolor: Colors.white,
          IconUrl: Images.yellowBackIcon,
        ),
        // SvgPicture.asset('asset/backIcon.png')
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
