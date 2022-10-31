import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class SearchBarWidget extends StatelessWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 42.h,
      width: 378.w,
      //  color: Colors.white,
      decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          // border: Border.all(
          //   color: const Color.fromARGB(255, 248, 202, 183),
          //   width: 2,
          // ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: 30,
                  ))
              : Container(),
          SizedBox(
            height: 42.h,
            width: 378.w,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                // iconColor: AppColors.primaryColor,
                //labelText: 'Enter item name here',
                hintText: ' Search Message',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 119, 114, 114),
                  fontSize: 20.sp,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: (String query) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           // builder: (context) => ResultScreen(query: query))
                //           );
              },
              readOnly: isReadOnly,
              onTap: () {
                // if (isReadOnly) {
                //   Get.to(() => Search_Screen());
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
