import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/bookings_shimmer.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import '../../components/no_internetConnection.dart';
import '../../model/HostelBookings.dart';
import '../../resources/FirebaseMethods.dart';
import '../../utils/routes/RoutesName.dart';
import '../../utils/style/Images.dart';

class booking_history extends StatelessWidget {
  const booking_history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.navigation_page);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Your Bookings',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() =>
                Navigator.pushNamed(context, RoutesName.navigation_page)),
            icon: hostel_appBarButton(
              Buttoncolor: AppColors.primaryColor,
              IconUrl: Images.whitebackButton,
            ),
          ),
        ),
        body: FutureBuilder(
          builder: (ctx, AsyncSnapshot<List<HostelBookings>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16.w, right: 16.w, top: 45),
                          child: Container(
                            padding: EdgeInsets.only(left: 14.w, right: 19.w),
                            height: 150.h,
                            width: 396.w,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F7FF),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: hostel_booking_component(
                              hostel: snapshot.data![index],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12.w, top: 25.h),
                            child: Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff2DD24E),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return no_internetConnection();
            } else if (snapshot.data == null) {
              return Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                child: Column(
                  children: [
                    bookings_shimmer(),
                    SizedBox(
                      height: 15.h,
                    ),
                    bookings_shimmer(),
                    SizedBox(
                      height: 15.h,
                    ),
                    bookings_shimmer(),
                    SizedBox(
                      height: 15.h,
                    ),
                    bookings_shimmer(),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              );
            }
            // Displaying LoadingSpinner to indicate waiting state
            return Container();
          },
          future: FirebaseMethods.getUserBookings(),
        ),
      ),
    );
  }
}

class hostel_booking_component extends StatelessWidget {
  final HostelBookings hostel;
  const hostel_booking_component({
    required this.hostel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          hostel.name!,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          hostel.hostel_address!,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 30.sp,
        ),
        Text(
          hostel.booking_date!,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        Row(
          children: [
            Icon(
              Icons.man,
              color: Colors.black,
              size: 25.h,
            ),
            Text(
              hostel.bookings!.toString(),
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.sp),
            ),
            SizedBox(
              width: 170.w,
            ),
            Text(
              '${hostel.charges} Rs',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
