import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/type_message.dart';

import '../../utils/style/AppColors.dart';

class chat_page extends StatefulWidget {
  const chat_page({super.key});

  @override
  State<chat_page> createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  TextEditingController _controller=TextEditingController();
  String message = "";

  void sendMessage(){

    
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Hostel Name",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.image,
              size: 61.h,
            ),
            subtitle: Text("Status",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300)),
          ),
          SizedBox(
            height: 14.h,
          ),
          Divider(
            color: Colors.black,
            indent: 19,
            endIndent: 19,
            thickness: 1,
          ),
          type_newMessage(),
        ],
      ),
    );
  }

  Container type_newMessage() {
    return Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 42.h,
                  // width: 371.w,
                  //  color: Colors.white,
                  decoration: BoxDecoration(
                      color: AppColors.textfieldsColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " Type message",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 106, 103, 103),
                        fontSize: 17.sp,
                      ),
                    ),
                    onChanged: (value) => setState(() {
                      message = value;
                    }),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                child: Container(
                  height: 42.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        );
  }
}
