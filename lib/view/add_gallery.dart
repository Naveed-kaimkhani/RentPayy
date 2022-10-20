import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentpayy/components/auth_screens_decor.dart';
import 'package:rentpayy/components/custom_appbar.dart';
import 'package:rentpayy/components/image_video_component.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class AddGallery extends StatefulWidget {
  const AddGallery({Key? key}) : super(key: key);

  @override
  State<AddGallery> createState() => _AddGalleryState();
}

class _AddGalleryState extends State<AddGallery> {

  List<XFile>? imageFileList = [];
  void selectImages() async {
    final selectedImaged = await ImagePicker().pickMultiImage();
    if (selectedImaged.isEmpty) {
      imageFileList!.addAll(selectedImaged);
    }
    setState(() {});
    print(imageFileList!.length);
  }
  bool onClick = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: custom_appbar(),
        // backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: Container(
                width: 428.w,
                height: 833.h,
                decoration: auth_screens_decor(),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45.h,
                      ),
                      Text(
                        'Add Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 26.sp),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                  Container(
                    height: 237.h,
                    width: 387.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42.h,
                        ),
                        Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.primaryColor,
                          size: 50,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                  itemCount: imageFileList!.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Image.file(File(imageFileList![index].path), fit: BoxFit.cover);
                                  }
                              ),
                            )
                        ),
                        InkWell(
                          onTap: () {
                              selectImages();
                          },
                          child: Container(
                              height: 67.h,
                              width: 157.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.primaryColor,
                              ),
                              child: Center(
                                  child: Text(
                                    'Browse',
                                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '*  Only PNG,JPG  with max size of 12 MB ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // ImageVideoComponent(),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: '*  Video with max size of 12 MB \n',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                  text: '*  Please refer to ',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black)),
                              TextSpan(
                                  text: 'Video Guidelines',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline))
                            ],
                          ))),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // onClick = true;
                                // onClick ? onClick = true : onClick = false;
                                onClick = !onClick;
                              });
                            },
                            child: Container(
                              width: 21.w,
                              height: 21.h,
                              decoration: BoxDecoration(
                                color: onClick
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: onClick
                                        ? AppColors.primaryColor
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: Icon(
                                Icons.check,
                                color: onClick ? Colors.white : Colors.black,
                                size: 13.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By checking this you agree to our ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          )),
                        ],
                      ),
                     SizedBox(height: 22,),
                     Padding(
                       padding: EdgeInsets.only(left: 200.w),
                       child: Container(
                         alignment: Alignment.bottomRight,
                         height: 67.h,
                         width: 157.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12.r),
                           color: AppColors.primaryColor,
                         ),
                         child: Center(
                           child: Text('Publish' ,style: TextStyle(color: Colors.white , fontSize: 17.sp),),
                         ),
                       ),
                     )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
