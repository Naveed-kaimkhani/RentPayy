import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class hostel_list extends StatelessWidget {
  hostel_list(
      {required this.name,
      required this.pic,
      required this.price,
      required this.rating,
      required this.ontap,
      //  required this.hostel_id,
      Key? key})
      : super(key: key);

  String name;
  int rating;
  int price;
  String pic;
  // String hostel_id;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 393.w,
      child: Stack(children: [
        Align(
          child: Container(
            alignment: Alignment.center,
            height: 148.h,
            width: 393.w,
            decoration: BoxDecoration(
              color: AppColors.textfieldsColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 7, right: 10, top: 7, bottom: 7),
                  child: ClipRRect(
                    // child: Image.asset("asset/roomrec.png"),
                    child: Image.network(pic),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 19.h,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Image.asset("asset/stars.png"),
                      // Image.network(hostel),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color.fromARGB(255, 9, 77, 133),
                            size: 12,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Jamshoro,Pakistan",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: price.toString(),
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor)),
                          TextSpan(
                              text: "/Month",
                              style:
                                  TextStyle(fontSize: 7, color: Colors.black)),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Center(
                    child: Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ))),
            onTap: ontap,
          ),
        ),
      ]),
    );
  }
}
