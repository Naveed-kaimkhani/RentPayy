import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Widget> list = [];
  TextEditingController controller = TextEditingController();
  String? filled = "UPS";
  @override
  void initState() {
    filled;
    list = [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600.h,
          width: 400.w,
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: 400.w,
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    setState(() {
                      filled = value;
                      print(filled);
                      list.add(
                          Text(filled!)
                      );
                    });
                  },
                ),
              ),
              Container(
                height: 200,
                width: 100,
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: list),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
