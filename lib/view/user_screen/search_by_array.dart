// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rentpayy/model/hostelModel.dart';

// class typeahead_searchBar extends StatefulWidget {
//   const typeahead_searchBar({super.key});

//   @override
//   State<typeahead_searchBar> createState() => _typeahead_searchBarState();
// }

// class _typeahead_searchBarState extends State<typeahead_searchBar> {
//   Future<List<hostelModel>> search(String query) async {
//     List<hostelModel> list = [];
//     String name="";
//     final result = await FirebaseFirestore.instance
//         .collection("hostels")
//         .where("name", arrayContains: query)
//         .get();
//     List search = result.docs.map((e) => e.data()).toList();
//     for (var i = 0; i < search.length; i++) {
//       hostelModel hos = hostelModel.fromJson(search[i]);
//       list.add(hos);
//     }
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 36.h),
//                 height: 55.h,
//                 width: 326.w,
//                 decoration: BoxDecoration(
//                     color: const Color(0xffFFFFFF),
//                     border: Border.all(
//                       color: const Color.fromARGB(255, 248, 202, 183),
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(10.r)),
//                 child: TextField(
//                   onChanged: (val){
//                       setState(() {
//                         name=val;
//                       });
//                   },
//                 )          ),
//                 StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("hostels").snapshots(),
//             builder: (context,
//                 AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting)
//                 return Center(
//                   child: Text("Nothing to show"),
//                 );
//               else if (snapshot.data!.docs.length == 0) {
//                 return Center(
//                   child: Text("No hostel found"),
//                 );
//               } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       var data = snapshot.data!.docs[index].data()
//                           as Map<String, dynamic>;

//                       if (name.isEmpty) {
//                         return ListTile(
//                           title: Text(
//                             data['name'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             data['email'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(data['image']),
//                           ),
//                         );
//                       }
//                       if (data['name']
//                           .toString()
//                           .toLowerCase()
//                           .startsWith(name.toLowerCase())) {
//                         return ListTile(
//                           title: Text(
//                             data['name'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             data['email'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(data['image']),
//                           ),
//                         );
//                       }
//                       return Container();
//                     });
//               }
//             },
//           )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
