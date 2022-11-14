import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/hostel_list.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset("asset/back2.png"),
        ),
        centerTitle: true,
        title: Text(
          "Favourites",
          style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(
              height: 38.h,
            ),
            hostel_list(
              name: "Bakhtawar Hostel",
              price: 200,
              rating: 4,
              ontap: () {
                setState(() {});
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            hostel_list(
              name: "Bakhtawar Hostel",
              price: 200,
              rating: 4,
              ontap: () {
                setState(() {});
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            hostel_list(
              name: "Bakhtawar Hostel",
              price: 200,
              rating: 4,
              ontap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
