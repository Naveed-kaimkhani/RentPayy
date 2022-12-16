import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/appbar_buttons.dart';
import '../../model/hostelModel.dart';
import '../../utils/style/Images.dart';
import 'facility_container.dart';
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
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    FirebaseRepository _firebaseRepository = new FirebaseRepository();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // icon: Image.asset(Images.backIcon),
            // icon: appbar_buttons(icon: Images.yellowBackIcon),
            icon: hostel_appBarButton(
                Buttoncolor: Colors.white, IconUrl: Images.yellowBackIcon),
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () async {
                setState(() {
                  isSelected = !isSelected;
                });
                await _firebaseRepository.addToFavourites(widget.hostel);
              },
              icon: appbar_buttons(
                  icon: isSelected ? Icons.favorite : Icons.favorite_border),
              // icon: LikeButton(
              //   size: 30,
              // ),
            ),
            IconButton(
              onPressed: () async {
                await Share.share(widget.hostel.pictures![1]);
              },
              icon: appbar_buttons(icon: Icons.share),
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
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2)),
                        itemCount: widget.hostel.pictures!.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            CachedNetworkImage(
                          imageUrl: widget.hostel.pictures![itemIndex],
                          imageBuilder: (context, imageProvider) => Container(
                            width: 428.w,
                            height: 469.h,
                            margin: EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.r),
                                  bottomRight: Radius.circular(30.r)),

                              // shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => Center(
                            widthFactor: 2.0,
                            heightFactor: 2.0,
                            // child: CircularProgressIndicator()
                            child: circle_progress(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        //     Container(
                        //   height: 469.h,
                        //   width: 428.w,
                        //   margin: EdgeInsets.symmetric(horizontal: 8.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30.r),
                        //       image:
                        //       DecorationImage(
                        //         image:
                        //         NetworkImage(
                        //             widget.hostel.pictures![itemIndex]),
                        //         fit: BoxFit.cover,
                        //       )
                        //       ),
                        // ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: selectedIndex,
                        count: widget.hostel.pictures!.length,
                        effect: WormEffect(
                          dotWidth: 10.w,
                          dotHeight: 10.h,
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
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        // Image(image: AssetImage(Images.location)),
                        Icon(
                          Icons.location_on_outlined,
                          color: Color.fromARGB(255, 28, 121, 197),
                          size: 18.h,
                        ),
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
                            Icon(
                              Icons.man,
                              color: Colors.black,
                              size: 20.w,
                            ),
                            // SizedBox(
                            //   width: 2.w,
                            // ),
                            Icon(
                              Icons.hotel,
                              color: Colors.black,
                              size: 20.w,
                            ),
                            SizedBox(
                              width: 6.sp,
                            ),
                            Text(
                              widget.hostel.available_capacity.toString(),
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.hostel.description!,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w300),
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

                    // facility_container(
                    //   text: 'Electricity',
                    //   // image: Images.facilities,
                    // ),
                    GridView.count(
                      padding: EdgeInsets.zero,

                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,

                      physics: new NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      children: widget.hostel.facilities!
                          .map<Widget>(
                            (e) => facility_container(text: e),
                          )
                          .toList(),
                      //  childAspectRatio: 1.1,
                    ),
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
