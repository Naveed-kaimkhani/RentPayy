import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/model/UserBookingInfo.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import '../../components/booking_info_shimmer.dart';
import '../../components/no_internetConnection.dart';
import '../../resources/FirebaseMethods.dart';
import '../../utils/style/Images.dart';

class booking_info extends StatelessWidget {
  const booking_info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Booking Info',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: hostel_appBarButton(
            Buttoncolor: AppColors.primaryColor,
            IconUrl: Images.whitebackButton,
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (ctx, AsyncSnapshot<List<UserBookingInfo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 12.w, right: 20.w, top: 43.h),
                        child: Container(
                          padding: EdgeInsets.only(left: 16.w),
                          width: 396.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: Color(0xffF4F7FF),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: booking_info_component(
                            Date: snapshot.data![index].bookingDate,
                            bookedBy: snapshot.data![index].name,
                            phone: snapshot.data![index].phone,
                            bookingNo: (index + 1).toString(),
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
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close,
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
                  booking_info_shimmer(),
                  SizedBox(
                    height: 15.h,
                  ),
                  booking_info_shimmer(),
                  SizedBox(
                    height: 15.h,
                  ),
                  booking_info_shimmer(),
                  SizedBox(
                    height: 15.h,
                  ),
                  booking_info_shimmer(),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            );
          } else if (snapshot.data!.length < 1) {
            return Text("No bookings");
          }
          // Displaying LoadingSpinner to indicate waiting state
          return Container(
            child: Text("No Bookings"),
          );
        },
        future: FirebaseMethods.getUserDetailsWhoBookedHostels(),
      ),
    );
  }
}

class booking_info_component extends StatelessWidget {
  String? bookingNo;
  String? bookedBy;
  String? Date;
  String? phone;

  booking_info_component({
    this.Date,
    this.bookedBy,
    this.bookingNo,
    this.phone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Booking No:  " + "$bookingNo"),
        Text("Booked by:  " + "$bookedBy"),
        Text("Phone:  " + "$phone"),
        Text("Date:  " + "$Date"),
      ],
    );
  }
}
