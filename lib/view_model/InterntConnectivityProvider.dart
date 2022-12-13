import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityProvider extends ChangeNotifier{
 late bool _isOnline;
 bool get isOnline=>_isOnline;

 InternetConnectivityProvider(){
  InternetConnectionChecker().onStatusChange.listen((status) {
        final connected=status==InternetConnectionStatus.connected;
        if (connected==true) {
          _isOnline=true;
          notifyListeners();
        } else {
          _isOnline=false;
          notifyListeners();
        }
        // showSimpleNotification(connected?Text("Connected To Internet"):Text("No Internet Connected"));
    // utils.flushBarErrorMessage(connected?"Connected To Internet":"No Internet Connection", context);
    });
 }
}