import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/view/user_screen/search_screen.dart';
import '../utils/routes/RoutesName.dart';
import '../utils/style/AppColors.dart';

class search_bar extends StatefulWidget {
  bool isReadOnly;
  Color color;  search_bar({
    required this.color,
    required this.isReadOnly,
    super.key,
  });

  @override
  State<search_bar> createState() => _search_barState();
}

class _search_barState extends State<search_bar> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 400.w,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,

          filled: true,
          fillColor: widget.color,
          prefixIcon: InkWell(
            child: Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          search_screen()));
            },
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(top: 1.h),
          suffixIcon: Image.asset('asset/vector(1).png'),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(242, 246, 255, 1)),
              borderRadius: BorderRadius.circular(12.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(242, 246, 255, 1)),
              borderRadius: BorderRadius.circular(12.r)),
        ),
        cursorColor: Colors.black,
        readOnly: widget.isReadOnly,
       
        onTap: () {
          if (widget.isReadOnly) {
            Navigator.of(context).pushNamed(RoutesName.search_screen);
          }
        },
      ),
    );
  }
}
