import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/navigation_page.dart';
import 'package:rentpayy/utils/routes/routes.dart';
import 'package:rentpayy/view/Hostel_Screen/Hostel_Registration.dart';
import 'package:rentpayy/view/Hostel_Screen/Hostel_signup.dart';
import 'package:rentpayy/view/Hostel_Screen/publish_ad_screen.dart';
import 'package:rentpayy/view/user_screen/User_signup.dart';
import 'package:rentpayy/view/user_screen/login_with_rentpayy.dart';
import 'package:rentpayy/view/user_screen/user_front_screen.dart';
import 'package:rentpayy/view_model/UserDetailsProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          builder: ((context, child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'RentPayy',
                // theme: ThemeData(
                //   primarySwatch: Colors.blue,
                // ),
                home: user_front_Screen(), // initialRoute: RoutesName.login,
                // onGenerateRoutes: Routes.onGenerateRoute(settings),
                onGenerateRoute: Routes.onGenerateRoute,
              ),
            );
          }),
        );
      },
    );
  }
}
