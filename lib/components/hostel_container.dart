import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/model/hostelModel.dart';

class HostelContainer extends StatelessWidget {
  final hostelModel? hostel;
  const HostelContainer({Key? key, required this.hostel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.sp,
      ),
      child: Container(
        height: 198.h,
        width: 187.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Color.fromRGBO(242, 246, 255, 1),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 125.h,
                  width: 187.w,
                  decoration: BoxDecoration(
                  
                  ),
                  child: Image.network(hostel!.pictures![0]!,),
                ),
                Positioned(
                  top: 103.h,
                  left: 7.w,
                  child: Container(
                    height: 17.67.h,
                    width: 53.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 173, 13, 1),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Center(
                      child: Text(
                        'Featured',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 11.h,
                  right: 17.w,
                  left: 150.w,
                  child: Image.asset('asset/heart.png'),
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hostel!.name.toString(),
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(width: 12.sp,),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: hostel!.charges.toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(245, 173, 13, 1),
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                      text: '/month',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w),
              child: Row(
                children: [
                  // Image(image: AssetImage('asset/hostelRoom.png')),
                  // Image.network(hostel!.pic1!),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Jamshoro,Pakistan',
                    style:
                        TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, top: 10.41.h),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      'asset/human1.png',
                    ),
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Image(
                    image: AssetImage(
                      'asset/humanBed.png',
                    ),
                    width: 13.w,
                  ),
                  SizedBox(
                    width: 2.sp,
                  ),
                  Text(
                    hostel!.available_capacity.toString(),
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
