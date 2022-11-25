// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/Models/Product.dart';
// import 'package:ecommerce_app/resources/Firestore_methods.dart';
// import 'package:ecommerce_app/widget/CheckoutCard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../widget/Cart_Item_Card.dart';

// class Cart_Screen extends StatefulWidget {
//   const Cart_Screen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Cart_Screen> createState() => _Cart_ScreenState();
// }

// class _Cart_ScreenState extends State<Cart_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: CheckoutCard(),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Center(
//               child: Text(
//             "Your Cart",
//             style: TextStyle(color: Colors.black),
//           )),
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("Users")
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .collection("cart")
//               .snapshots(),
//           builder: (context,
//               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return Center(child: Text("Nothing to show"),);
//             else {
//               return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     Product product =
//                         Product.fromJson(snapshot.data!.docs[index].data());

//                     return Dismissible(
//                         direction: DismissDirection.endToStart,
//                         onDismissed: (direction) {
//                           Firestore_method.deleteProductFromCart(
//                               uid: product.uid);
//                           print("In delete ");
//                         },
//                         key: Key(product.uid),
//                         background: Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20.w),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.orange,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: const [
//                                 Icon(
//                                   Icons.delete_rounded,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                               ],
//                             )),
//                         child: Cart_Item_Card(product: product));

//                     ;
//                   });
//             }
//           },
//         )
//         );
//   }
// }