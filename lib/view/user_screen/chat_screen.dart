// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rentpayy/components/search_bar_widget.dart';

// class chat_screen extends StatefulWidget {
//   const chat_screen({super.key});

//   @override
//   State<chat_screen> createState() => _chat_screenState();
// }

// class _chat_screenState extends State<chat_screen> {
//   String mtoken = "";

//   // This widget is the root of your application.
//   void requestPermission() async {
//     FirebaseMessaging _messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await _messaging.requestPermission(
//         alert: true,
//         badge: true,
//         carPlay: true,
//         announcement: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true);
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("permission grantedd");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user granted provisional permission");
//     } else {
//       print("permission declined");
//     }
//   }

//   void getToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) => () {
//           setState(() {
//             mtoken = token!;
//           });
//           print("device token");
//           print(mtoken);
//         });
//   }

//   void initInfo() {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     var androidInitialize =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitialize = const DarwinInitializationSettings();
//     var initializationSettings =
//         InitializationSettings(android: androidInitialize, iOS: iosInitialize);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (payload) async {
//       try {
//         if (payload != null) {
//         } else {}
//       } catch (e) {}
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 25.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Chat",
//               style: TextStyle(
//                   fontSize: 27.sp,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Hind'),
//             ),
//             SizedBox(
//               height: 18.h,
//             ),
//             SearchBarWidget(
//               hasBackButton: false,
//               isReadOnly: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
