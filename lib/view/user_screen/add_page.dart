import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/hostelModel.dart';
import '../../utils/style/Images.dart';
import 'ad_page_container.dart';
// import '../components/ad_page_container.dart';
// import '../components/profile_reviews_component.dart';
// import '../utils/style/Images.dart';

class AdPage extends StatefulWidget {
  
  final hostelModel hostel;

  AdPage({Key? key, required this.hostel}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    FirebaseRepository _firebaseRepository=new FirebaseRepository();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(Images.backIcon),
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () async{
             await   _firebaseRepository.addToFavourites(widget.hostel);
              },
              icon: Image.asset(Images.favourite),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(Images.share),
            ),
            SizedBox(
              width: 22.w,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 469.h,
                  width: 428.w,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50.r),
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         Images.hostelImage,
                  //       ),
                  //       fit: BoxFit.cover,
                  //     )),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            onPageChanged: (index, reason) => setState(() {
                                  selectedIndex = index;
                                }),
                            height: 400.h,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            // autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2)),
                        itemCount: widget.hostel.pictures!.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          height: 469.h,
                          width: 428.w,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                    widget.hostel.pictures![itemIndex]),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: selectedIndex,
                        count: widget.hostel.pictures!.length,
                        effect: WormEffect(
                          dotWidth: 14.w,
                          dotHeight: 14.h,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: Color.fromARGB(255, 177, 167, 167),
                        ),
                        duration: Duration(milliseconds: 700),
                      )
                    ],
                  )
                  // child: pictures_list(hostel: hostel),
                  ),
              Padding(
                padding: EdgeInsets.only(left: 19.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      children: [
                        // Image(image: AssetImage(Images.location)),
                        Icon(Icons.location_on_outlined,color: Color.fromARGB(255, 0, 63, 114),),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Jamshoro,Pakistan',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hostel.name!,
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w500),
                        ),
                        // SizedBox(width: 12.sp,),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: widget.hostel.charges!.toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(245, 173, 13, 1),
                                          fontSize: 33.sp,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                    text: '/month',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down , color: Colors.black,))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(
                                Images.human1,
                              ),
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Image(
                              image: AssetImage(Images.humanBed),
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 2.sp,
                            ),
                            Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 100.w,
                        ),
                        // Text(
                        //   '16/09/2020',
                        //   style: TextStyle(
                        //       fontSize: 12.sp, fontWeight: FontWeight.w300),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.hostel.description!,
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Facilities',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Electricity',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 82.w,
                    //     ),
                    ad_page_container(
                      text: 'Electricity',
                      // image: Images.facilities,
                    ),
                    //     SizedBox(
                    //       width: 80.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Transport',
                    //       image: Images.facilities1,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Generator',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 80.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Generator',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 79.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Kitchen',
                    //       image: Images.facilities1,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Study Hall',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 80.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Study Hall',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 79.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Solar',
                    //       image: Images.facilities1,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    // Row(
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Kitchen',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 90.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Kitchen',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 90.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'water',
                    //       image: Images.facilities1,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    // Row(
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Solar',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 100.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Solar',
                    //       image: Images.facilities,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    // Row(
                    //   children: [
                    //     ad_page_container(
                    //       text: 'Water',
                    //       image: Images.facilities,
                    //     ),
                    //     SizedBox(
                    //       width: 96.w,
                    //     ),
                    //     ad_page_container(
                    //       text: 'Water',
                    //       image: Images.facilities,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Ad ID 10231445',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      height: 115.h,
                      width: 388.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    // ProfileReviewsComponent(),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // ProfileReviewsComponent(),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // ProfileReviewsComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
