import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/utils/style/Images.dart';

import '../components/setting_component.dart';

class setting_screen extends StatelessWidget {
  const setting_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(Images.backIcon1),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 27.w, top: 28.h, right: 27.w),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(Images.profile),
                  ),
                  Column(
                    children: [
                      Text(
                        'Hira Amir',
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 13.w,
                          ),
                          Image(image: AssetImage(Images.location)),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'Jamshoro,Pakistan',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 14.h,
              ),
              SizedBox(
                height: 35.h,
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Image.asset(Images.profile1),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text('Account'),
                  ],
                ),
                children: [
                  ListTile(
                    onTap: (){},
                    title: setting_component(
                      text: 'Personal Data',
                    ),
                  ),
                  ListTile(
                    onTap: (){},
                    title: setting_component(
                      text: 'Password Options',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
