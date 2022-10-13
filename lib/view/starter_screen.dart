import 'package:flutter/material.dart';
import 'package:rentpayy/view/user_seller_screen.dart';

import '../components/buttons.dart';
import '../components/mini_container.dart';


class StarterScreen extends StatelessWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5AD0D),
        body: Stack(
          children: [
             Positioned(
                left: -15,
                top: 35,
                child: MiniContainer(
                    height: 90, width: 90, image: 'assets/car.png')),
             Positioned(
                left: 35,
                top: 160,
                child: MiniContainer(
                  height: 40,
                  width: 40,
                  image: 'assets/sofa.png',
                )),
            const Positioned(
                left: 290,
                top: 70,
                child: MiniContainer(
                  height: 40,
                  width: 40,
                  image: 'assets/sofa.png',
                )),
            const Positioned(
                left: 285,
                top: 220,
                child: MiniContainer(
                    height: 92, width: 92, image: 'assets/headphone.png')),
            const Positioned(
                left: -3,
                top: 270,
                child: MiniContainer(
                    height: 100, width: 100, image: 'assets/shirt.png')),
            const Positioned(
                left: 270,
                top: 340,
                child: MiniContainer(
                    height: 50, width: 50, image: 'assets/books.png')),
            const Positioned(
                left: 120,
                top: 140,
                child: MiniContainer(
                    height: 140, width: 140, image: 'assets/house.png')),
            const Positioned(
                left: 220,
                child: MiniContainer(
                    height: 80, width: 80, image: 'assets/building.png')),
            Positioned(
              top: 420,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: 378,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Image(image: AssetImage('assets/rentB1.png')),
                    const Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Image(image: AssetImage('assets/text.png')),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur'
                        ' adipiscing elit, sed do eiusmod tempor ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserSellerScree()));
                      },
                    ),
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
