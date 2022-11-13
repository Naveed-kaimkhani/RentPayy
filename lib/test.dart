import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(children: [
          SizedBox(
            height: 13.h,
          ),
          Container(
            width: 397.w,
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
                                borderRadius:
                                BorderRadius.circular(3.r),
                              ),
                              child: Image.asset(
                                'asset/downArrow.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 14.w, right: 15.w, top: 26.h),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
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
                                backgroundImage: AssetImage(
                                    'asset/profileImage.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 30.w,
                  top: 140.h,
                  child: Container(
                    height: 42.h,
                    width: 339.w,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(7.r),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 1,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ]),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.only(top: 1.h),
                          suffixIcon:
                          Image.asset('asset/vector(1).png'),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
                  (context, index) => ListTile(title: Text('Item #$index')),
              // Builds 1000 ListTiles
              childCount: 1000,
            ),
          )
        ]),

              ),

    );
  }
}
