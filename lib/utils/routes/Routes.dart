import 'package:flutter/material.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/view/Hostel_Screen/Hostel_signup.dart';
import 'package:rentpayy/view/Hostel_Screen/facilities.dart';
import 'package:rentpayy/view/Hostel_Screen/hostel_login.dart';
import 'package:rentpayy/view/Hostel_Screen/publish_ad_screen.dart';
import 'package:rentpayy/view/Hostel_Screen/seller_dashboard.dart';
import 'package:rentpayy/view/user_screen/User_signup.dart';
import 'package:rentpayy/view/user_screen/login_with_rentpayy.dart';
import 'package:rentpayy/view/user_screen/search_screen.dart';
import '../../navigation_page.dart';
import '../../view/Hostel_Screen/add_gallery.dart';
import '../../view/user_screen/login_screen.dart';
import '../../view/user_screen/settings.dart';
import '../../view/user_screen/user_front_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return _buildRoute(login_screen(), settings);

      case RoutesName.userSignup:
        return _buildRoute(User_signup_page(), settings);

      case RoutesName.loginWithRentPayy:
        return _buildRoute(login_with_rentpayy(), settings);

      case RoutesName.navigation:
        return _buildRoute(navigation_page(), settings);
      case RoutesName.facilities:
        return _buildRoute(Facilities(), settings);

      case RoutesName.uploadPictures:
        return _buildRoute(add_gallery(), settings);

      case RoutesName.setting:
        return _buildRoute(setting_screen(), settings);

      case RoutesName.publish_ad_screen:
        return _buildRoute(publish_ad_screen(), settings);
      case RoutesName.user_front_screen:
        return _buildRoute(user_front_Screen(), settings);
      case RoutesName.search_screen:
        return _buildRoute(search_screen(), settings);
      case RoutesName.navigation_page:
        return _buildRoute(navigation_page(), settings);
      case RoutesName.SellerDashboard:
        return _buildRoute(SellerDashboard(), settings);
      case RoutesName.hostel_login:
        return _buildRoute(hostel_login(), settings);
      case RoutesName.Hostel_Signup:
        return _buildRoute(Hostel_Signup(), settings);
      default:
        return _buildRoute(const Scaffold(body: Center(
          child: Text("NO Route Found"),
        ),), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
