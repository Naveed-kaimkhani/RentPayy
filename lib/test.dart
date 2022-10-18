import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/AppColors.dart';

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Widget> list = [];
  TextEditingController controller = TextEditingController();
  String? filled = "";
  @override
  void initState() {
    filled;
    list = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600.h,
        width: 400.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 300,),

              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: AppColors.textfieldsColor,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 51,
                      width: 160,
                      child: Column(
                        children: [
                          Container(
                            height: 51,
                            width: 160,
                            child: ListView(
                              children:[ Row(
                                children: list,
                              ),
                        ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    height: 50.h,
                    width: 400.w,
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        setState(() {
                          filled = value;
                          print(filled);
                          list.add(Text(filled!));
                        });
                      },
                    ),
                  ),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
