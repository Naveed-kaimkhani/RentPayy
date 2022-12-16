import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/model/hostelModel.dart';

import '../resources/FirebaseRepository.dart';
import 'circle_progress.dart';

class HostelContainer extends StatelessWidget {
  final hostelModel? hostel;
  const HostelContainer({Key? key, required this.hostel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseRepository _firebaseRepository = new FirebaseRepository();

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
                CachedNetworkImage(
                  imageUrl: hostel!.pictures![0]??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                  imageBuilder: (context, imageProvider) => Container(
                    width: 187.w,
                    height: 125.h,
                    // margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r)),

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
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                  child: InkWell(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      await _firebaseRepository.addToFavourites(hostel!);
                    },
                  ),
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
                    style: TextStyle(
                        fontSize: hostel!.name!.length > 15 ? 12.sp : 15.sp,
                        fontWeight: FontWeight.w500),
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
              padding: EdgeInsets.only(left: 8.w, top: 8.41.h),
              child: Row(
                children: [
                  Icon(
                    Icons.man,
                    color: Colors.black,
                    size: 15.h,
                  ),
                  // SizedBox(
                  //   width: 2.w,
                  // ),
                  Icon(
                    Icons.hotel,
                    color: Colors.black,
                    size: 15.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    hostel!.available_capacity.toString(),
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
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
