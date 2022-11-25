import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/hostel_list.dart';
import 'package:rentpayy/model/hostelModel.dart';
import 'package:rentpayy/view/user_screen/add_page.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset("asset/back2.png"),
        ),
        centerTitle: true,
        title: Text(
          "Favourites",
          style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
       body:StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("cart")
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: Text("Nothing to show"),);
            else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                   hostelModel hostel =
                        hostelModel.fromJson(snapshot.data!.docs[index].data());

                    // return Cart_Item_Card(product: product);
                    return hostel_list(name: hostel.name!, price: hostel.charges!, rating: 4, ontap:(){       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AdPage(hostel: hostel,)), );
                    
                  });
                  }
              );
            }
          },
        )
      // Padding(
      //   padding: EdgeInsets.only(left: 18, right: 18),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 38.h,
      //       ),
      //       hostel_list(
      //         name: "Bakhtawar Hostel",
      //         price: 200,
      //         rating: 4,
      //         ontap: () {
      //           setState(() {});
      //         },
      //       ),
      //       SizedBox(
      //         height: 12.h,
      //       ),
      //       hostel_list(
      //         name: "Bakhtawar Hostel",
      //         price: 200,
      //         rating: 4,
      //         ontap: () {
      //           setState(() {});
      //         },
      //       ),
      //       SizedBox(
      //         height: 12.h,
      //       ),
      //       hostel_list(
      //         name: "Bakhtawar Hostel",
      //         price: 200,
      //         rating: 4,
      //         ontap: () {
      //           setState(() {});
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
