import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class Custom_Checkbox extends StatefulWidget {
  String? text;
  Function()? func;
  bool isselected = false;
  Custom_Checkbox({required this.text, required this.func,required this.isselected, Key? key}) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => _Custom_CheckboxState();
}

class _Custom_CheckboxState extends State<Custom_Checkbox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 160.w,
        height: 51.2.h,
        decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 14.w,
            ),
            Container(
              child:
            widget.isselected
                ?  Image.asset("asset/checkbox.png",height: 31.h,width: 31.w,)
                :  Image.asset("asset/uncheck.png",height: 31.h,width: 31.w,),
            ),
            SizedBox(
              width: 21.w,
            ),
            Text(
              widget.text!,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      onTap: widget.func!,
    );
  }
}
