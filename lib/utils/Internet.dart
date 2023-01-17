import 'package:internet_connection_checker/internet_connection_checker.dart';

class Internet{
  bool connected=false;
  checkInternetConnection()async{
      connected=await InternetConnectionChecker().hasConnection;
      final msg=connected?"Connected To Internet":"No Intenet Connection";
      // showSimpleNotification(Text(msg));
  
  }
}