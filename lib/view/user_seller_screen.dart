import 'package:flutter/material.dart';

import '../components/mini_container.dart';
import '../components/user_seller_component.dart';

class UserSellerScree extends StatelessWidget {
  const UserSellerScree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5AD0D),
        body: Stack(
          children: [
             Positioned(
              top: 30,
                left: 23,
                child: MiniContainer(height: 35, width: 35, image: 'assets/backButton.png',)),
            Positioned(
              top: 90,
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                height: 700,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50) , topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 80,),
                    UserSellerComponent(height: 190, width: 200, image: 'assets/female.png', text: "User"),
                    SizedBox(height: 40,),
                    UserSellerComponent(height: 190, width: 200, image: 'assets/male.png', text: "Seller"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
