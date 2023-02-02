import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/starter_screen.dart';

showLogoutPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to logout?"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.setInt('initScreen', 0);
                          await preferences.setInt('isUser', 0);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StarterScreen()));
                        },
                        child: Text("Yes"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
