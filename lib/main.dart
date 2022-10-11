import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/test.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/utils/routes/routes.dart';
import 'package:rentpayy/view/login_screen.dart';
import 'package:rentpayy/view/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          builder: ((context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'RentPayy',
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              home: login_screen(),
              // initialRoute: RoutesName.login,
              // onGenerateRoutes: Routes.onGenerateRoute(settings),
              onGenerateRoute: Routes.onGenerateRoute,
            );
          }),
        );
      },
    );
  }
}
