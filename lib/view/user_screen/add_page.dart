import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
import 'package:rentpayy/components/circle_progress.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/resources/FirebaseRepository.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/view/user_screen/book_now.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/appbar_buttons.dart';
import '../../model/hostelModel.dart';
import '../../utils/style/Images.dart';
import 'facility_container.dart';

class AdPage extends StatefulWidget {
  final hostelModel hostel;

  AdPage({Key? key, required this.hostel}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  var selectedIndex = 0;
  bool isSelected = false;

  launchWhatsapp() async {
    var whatsapp = widget.hostel.hostel_phone!;
    var whatsappAndroid = Uri.parse("whatsapp://send?phone=" +
        "(" +
        "92$whatsapp)" +
        "&text=Hello i want to book a hostel");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  launchMessages() async {
    var whatsapp = widget.hostel.hostel_phone!;
    Uri whatsappAndroid = Uri.parse(
        "sms:" + "(" + "92$whatsapp)" + "?body=Hello i want to book a hostel");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("unable to open"),
        ),
      );
    }
  }

  launchphone() async {
    var whatsapp = widget.hostel.hostel_phone!;
    Uri whatsappAndroid = Uri.parse("tel:" + "(" + "92$whatsapp)");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("unable to open"),
        ),
      );
    }
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    int count = widget.hostel.visits!;
    setState(() {
      count++;
    });
    db.collection("hostels").doc(widget.hostel.uid).update({
      'visits': count,
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseRepository _firebaseRepository = new FirebaseRepository();
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              GFFloatingWidget(
                  child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                                width: 403,
                                height: 166,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Text(
                                      "Contact via",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  launchWhatsapp();
                                                });
                                              },
                                              child: Image.asset(
                                                "asset/whatsapp.png",
                                                height: 66.h,
                                                width: 66.w,
                                              )),
                                          SizedBox(
                                            width: 58.w,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  launchMessages();
                                                });
                                              },
                                              child: Image.asset(
                                                "asset/sms.png",
                                                height: 66.h,
                                                width: 66.w,
                                              )),
                                          SizedBox(
                                            width: 58.w,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  launchphone();
                                                });
                                              },
                                              child: Image.asset(
                                                "asset/whatsapp.png",
                                                height: 66.h,
                                                width: 66.w,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      });
                    },
                    child: Container(
                      height: 47,
                      width: 149,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Contact",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => book_now(
                                    hostel: widget.hostel,
                                  )));
                    },
                    child: Container(
                      height: 47,
                      width: 149,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Book now",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
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
                await Share.share(widget.hostel.pictures.toString());
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
                            autoPlayInterval: Duration(seconds: 4)),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
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
                          widget.hostel.hostel_address ?? "No Address found",
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
                              size: 15.h,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Icon(
                              Icons.hotel,
                              color: Colors.black,
                              size: 15.h,
                            ),
                            SizedBox(
                              width: 6.sp,
                            ),
                            Text(
                              widget.hostel.available_capacity.toString(),
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
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.hostel.description ?? "No Description",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Hostel Type',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.hostel.hostel_type!,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w300),
                    ),

                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Gender Type',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.hostel.hostel_gender_type!,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Facilities',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.sp),
                    ),
                    // SizedBox(
                    //   height: 11.h,
                    // ),
                    GridView.count(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      physics: new NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      children: widget.hostel.facilities!
                          .map<Widget>(
                            (e) => facility_container(text: e),
                          )
                          .toList(),
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
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
