import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/routes/RoutesName.dart';
import '../utils/style/AppColors.dart';
import '../view/user_screen/result_screen.dart';

class search_bar extends StatefulWidget {
  bool isReadOnly;
  Color color;
//bool hasBackButton;
  search_bar({
    required this.color,
    required this.isReadOnly,
    // required this.hasBackButton,
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
      // padding: EdgeInsets.only(
      //   left: 35,
      // ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,

          filled: true,
          fillColor: widget.color,
          // fillColor: Color.fromRGBO(242, 246, 255, 1),
          // focusColor: Color.fromARGB(255, 197, 42, 42),
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
                          result_screen(query: _controller.text)));
            },
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(top: 1.h),
          suffixIcon: Image.asset('asset/vector(1).png'),
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(242, 246, 255, 1)),
              borderRadius: BorderRadius.circular(12.r)
              // .copyWith(
              //     topRight: Radius.circular(0),
              //     topLeft: Radius.circular(0)
              //     )
              ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(242, 246, 255, 1)),
              borderRadius: BorderRadius.circular(12.r)
              // .copyWith(
              //     topRight: Radius.circular(0),
              //     topLeft: Radius.circular(0)
              //     )
              ),
        ),
        cursorColor: Colors.black,
        readOnly: widget.isReadOnly,
        onFieldSubmitted: (String query) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => result_screen(query: query)));
        },
        onTap: () {
          if (widget.isReadOnly) {
            Navigator.of(context).pushNamed(RoutesName.search_screen);
          }
        },
      ),
    );
  }
}
