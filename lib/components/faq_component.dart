import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/style/AppColors.dart';

class FAQComponent extends StatelessWidget {
  final String text;
  final String Answer;
  const FAQComponent({Key? key, required this.text,required this.Answer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _customIcon = false;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyBackgroundCOlor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ExpansionTile(
          title: Text(text),
          // textColor: Colors.black,
          collapsedIconColor: Colors.black,
          leading: Icon(
            _customIcon ? Icons.minimize : Icons.add,
          ),
          children: [
            ListTile(
              title: Text(
                Answer,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
          childrenPadding: EdgeInsets.only(left: 15.w),
          backgroundColor: AppColors.greyBackgroundCOlor,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
