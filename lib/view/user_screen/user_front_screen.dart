import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/mini_container.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

import '../../components/bottom_navigation_bar.dart';
import '../../components/hostel_container.dart';
import '../../components/user_recommended_portion.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:  BottomNavigationBarExample(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
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
                                children: [
                                  Text(
                                    'Hello Hira!',
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
                  SizedBox(
                    height: 37.h,
                  ),
                  Container(
                    height: 185.h,
                    width: 393.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color.fromRGBO(245, 173, 13, 1),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 60.h, left: 18.w),
                              child: Text(
                                'Rent in just 3 steps!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18.w, right: 154.w),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur '
                                'adipiscing elit, sed do eiusmod tempor ',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: 7.h,
                          left: 209.w,
                          right: 149.w,
                          child: Image.asset('asset/headphone.png'),
                        ),
                        Positioned(
                          top: 3.h,
                          left: 279.w,
                          right: 69.w,
                          child: Image.asset('asset/sofa.png'),
                        ),
                        Positioned(
                          top: 28.h,
                          left: 351.w,
                          right: 9.w,
                          child: Image.asset('asset/books.png'),
                        ),
                        Positioned(
                          top: 47.h,
                          left: 279.w,
                          right: 54.w,
                          child: Image.asset('asset/shirt.png'),
                        ),
                        Positioned(
                          top: 148.h,
                          left: 239.w,
                          right: 84.w,
                          child: Image.asset('asset/car1.png'),
                        ),
                        Positioned(
                          top: 136.h,
                          left: 343.w,
                          right: 1.76.w,
                          child: Image.asset('asset/building.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 27.w, top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Browse Categories',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        UserRecommededPortion(
                          text: 'See all',
                          image: 'asset/fArrow.png',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  // SingleChildScrollView(
                  //   physics: BouncingScrollPhysics(),
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       UserScreenContainer(
                  //           image: 'asset/bulding1.png', text: 'Hostels'),
                  //       UserScreenContainer(
                  //           image: 'asset/car2.png', text: 'Vehicle'),
                  //       UserScreenContainer(
                  //           image: 'asset/headphone2.png', text: 'Electronics'),
                  //       UserScreenContainer(
                  //           image: 'asset/shirt2.png', text: 'Clothes'),
                  //       UserScreenContainer(
                  //           image: 'asset/books2.png', text: 'Books'),
                  //       UserScreenContainer(
                  //           image: 'asset/sofa2.png', text: 'Furniture'),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 27.w, top: 25.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended for you',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        UserRecommededPortion(
                          text: 'See all',
                          image: 'asset/fArrow.png',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                          itemCount: 10,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return HostelContainer();
                          })),
                ],
              ),
              Positioned(
                left: 45.w,
                top: 144.h,
                child: Container(
                  height: 42.h,
                  width: 339.w,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(7.r),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.5),
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
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.only(top: 1.h),
                        suffixIcon: Image.asset('asset/vector(1).png'),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
