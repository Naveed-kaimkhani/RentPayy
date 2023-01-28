import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class booking_info extends StatelessWidget {
  const booking_info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Booking Info', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset("asset/orangeBackIcon.png" , height: 32.h, width: 32.w,),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (context , index){
           return Stack(
             children: [
             Padding(
               padding: EdgeInsets.only(left: 12.w , right: 20.w , top: 43.h ),
               child: Container(
                 padding: EdgeInsets.only(left: 16.w),
               width: 396.w,
               height: 150.h,
               decoration: BoxDecoration(
                 color: Color(0xffF4F7FF),
                 borderRadius: BorderRadius.circular(10.r),
               ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("Booking No:  " + "01"),
                     Text("Booked by:  " + "Hira Amir"),
                     Text("Date:  " + "01/19/2003"),
                   ],
                 ),
            ),
             ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:  EdgeInsets.only(right: 12.w, top: 25.h),
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Icon(Icons.close, color: Colors.white,size: 18,),
                    ),
                  ),
                ),
                ),
             ],
           );
      }),
    );
  }
}
