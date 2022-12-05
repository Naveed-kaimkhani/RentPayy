import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/AppColors.dart';

class SellerAppBar extends StatelessWidget implements PreferredSizeWidget {
  SellerAppBar({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: 160,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Column(
        children: [
          Container(
            // width: 397.w,
            width: Size.width,
            height: 190.h,
            child: Stack(
              children: [
                Container(
                  width: 397.w,
                  height: 145.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 246, 255, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        topRight: Radius.circular(35.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 17.h, left: 14.w),
                        child: Row(
                          children: [
                            Text(
                              'Jamshoro',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              height: 15.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: Image.asset(
                                'asset/downArrow.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello Osama!',
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Welcome back, Ready to Rent?',
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Container(
                              height: 61.h,
                              width: 61.w,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('asset/profileImage.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => Size.fromHeight(height);
}
