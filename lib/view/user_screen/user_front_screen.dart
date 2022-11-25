import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/view/user_screen/add_page.dart';
import '../../components/banner.dart';
import '../../components/bottom_navigation_bar.dart';
import '../../components/hostel_container.dart';
import '../../model/hostelModel.dart';
import '../../resources/FirebaseMethods.dart';

class user_front_Screen extends StatefulWidget {
  const user_front_Screen({Key? key}) : super(key: key);

  @override
  State<user_front_Screen> createState() => _user_front_ScreenState();
}

class _user_front_ScreenState extends State<user_front_Screen> {
  final ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;
  @override
  void initState() {
    super.initState();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        appBar: AppBar(
          toolbarHeight: 160,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
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
                            padding: EdgeInsets.only(
                                left: 14.w, right: 15.w, top: 26.h),
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 13.h,
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _showAppbar ? 150 : 0,
                  child: banner()),
              SizedBox(
                height: 25.h,
              ),
              // Container(
              //   height: 480,
              //   child: GridView.builder(
              //     controller: _scrollViewController,
              //     itemCount: 20,
              //     itemBuilder: (context, index) {
              //       return Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           HostelContainer(),
              //         ],
              //       );
              //     },
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 10,
              //       crossAxisSpacing: 10,
              //     ),
              //   ),
              // ),
              FutureBuilder(
                builder: (ctx, AsyncSnapshot<List<hostelModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: TextStyle(fontSize: 18),
                        ),
                      );

                      // if we got our data
                    } else if (snapshot.hasData) {
                      // Extracting data from snapshot object
                      //final data = snapshot.data as String;
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          controller: _scrollViewController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage(
                                                hostel: snapshot.data![index])),
                                      );
                                    },
                                    child: HostelContainer(
                                      hostel: snapshot.data![index],
                                    )),
                              ],
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                        ),
                      );
                    }
                  }

                  // Displaying LoadingSpinner to indicate waiting state
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },

                // Future that needs to be resolved
                // inorder to display something on the Canvas
                future: FirebaseMethods.getHostelsData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
