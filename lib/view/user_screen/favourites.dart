import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/hostel_list.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/resources/FirebaseRepository.dart';

import 'package:rentpayy/view/user_screen/add_page.dart';

import '../../utils/style/Images.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    FirebaseRepository _firebaseRepository = FirebaseRepository();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //   onPressed: (() =>
          //   // Navigator.pushNamed(context, RoutesName.user_front_screen)
          //   Navigator.pop(context)
          //   ),
          //   icon: Container(
          //     height: 32,
          //     width: 32,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       color: AppColors.primaryColor,
          //     ),
          //     child: Center(child: Image.asset(Images.whitebackButton)),
          //   ),
          // ),
          centerTitle: true,
          title: Text(
            "Favourites",
            style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("favorites")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("user_fav")
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: Text("Nothing to show"),
              );
            else if (snapshot.data!.docs.length == 0) {
              return Center(
                child: Text("No favorites"),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    hostelModel hostel =
                        hostelModel.fromJson(snapshot.data!.docs[index].data());

                    // return Cart_Item_Card(product: product);
                    return InkWell(
                      child: hostel_list(
                          name: hostel.name!,
                          price: hostel.charges!,
                          pic: hostel.pictures![0],
                          // hostel_id: hostel.uid!,
                          rating: 4,
                          ontap: () {
                            _firebaseRepository
                                .removeFromFavourites(hostel.uid!);
                          }),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdPage(
                                    hostel: hostel,
                                  )),
                        );
                      },
                    );
                  });
            }
          },
        )
        );
  }
}
