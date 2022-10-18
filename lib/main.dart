import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/test.dart';
import 'package:rentpayy/utils/routes/routes.dart';


import 'package:rentpayy/view/user_screen/login_screen.dart';
import 'package:rentpayy/view/user_screen/login_with_rentpayy.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
