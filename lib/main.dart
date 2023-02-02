import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/utils/routes/routes.dart';
import 'package:rentpayy/view/starter_screen.dart';
import 'package:rentpayy/view_model/HostelDetailsProvider.dart';
import 'package:rentpayy/view_model/UserDetailsProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
int? initScreen;
int? isUser;
int? isSelller;
List<String> testDeviceIds = ['1C597520A8B596626783357B70C4FA28'];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // MobileAds.in
  MobileAds.instance.initialize();

  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  MobileAds.instance.updateRequestConfiguration(configuration);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  isUser = preferences.getInt('isUser');
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
                ChangeNotifierProvider(create: (_) => HostelDetailsProvider()),
                ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'RentPayy',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                // home: initScreen == 0 || initScreen == null
                //     ? StarterScreen()
                //     : isUser == 1
                //         ? navigation_page()
                //         : SellerDashboard(),
                home:StarterScreen(),

                onGenerateRoute: Routes.onGenerateRoute,
              ),
            );
          }),
        );
      },
    );
  }
}
