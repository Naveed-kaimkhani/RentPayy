import 'package:flutter/material.dart';

import '../utils/style/AppColors.dart';
import '../utils/style/Images.dart';

class upper_design extends StatelessWidget implements PreferredSizeWidget {
  const upper_design({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      // leading: IconButton(
      //   onPressed: (() => Navigator.pop(context)),
      //   icon: Image.asset(Images.backIcon),
      //   // SvgPicture.asset('asset/backIcon.png')
      // ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
