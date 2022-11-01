import 'package:flutter/material.dart';
import 'package:rentpayy/utils/routes/RoutesName.dart';
import 'package:rentpayy/view/user_screen/User_signup.dart';
import 'package:rentpayy/view/user_screen/login_with_rentpayy.dart';

import '../../view/user_screen/login_screen.dart';

class Routes{
    static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return _buildRoute( login_screen(), settings);            
      
      case RoutesName.userSignup:
        return _buildRoute( User_signup_page(), settings);  
   
      case RoutesName.loginWithRentPayy:
        return _buildRoute( login_with_rentpayy(), settings);  
   
         default:
        return _buildRoute(const Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
