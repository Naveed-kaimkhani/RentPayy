import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/hostel_appBarButton.dart';
import 'package:rentpayy/model/hostelModel.dart';
import '../../components/hostel_container.dart';
import '../../components/shimmer_hostel_container.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';
import 'add_page.dart';

class search_screen extends StatefulWidget {
  const search_screen({super.key});

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: hostel_appBarButton(
                  Buttoncolor: AppColors.primaryColor,
                  IconUrl: Images.whitebackButton)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    height: 47.h,
                    width: 400.w,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.textfieldsColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.only(top: 1.h),
                        suffixIcon: Image.asset('asset/vector(1).png'),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(242, 246, 255, 1)),
                            borderRadius: BorderRadius.circular(12.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(242, 246, 255, 1)),
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                      cursorColor: Colors.black,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 8.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('hostels')
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  shimmer_hostel_container(),
                                  shimmer_hostel_container(),
                                ],
                              ),
                              Row(
                                children: [
                                  shimmer_hostel_container(),
                                  shimmer_hostel_container(),
                                ],
                              )
                            ],
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshots.data!.docs[index].data()
                                    as Map<String, dynamic>;

                                if (name.isEmpty) {
                                  return Container();
                                }
                                if (data['name']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(name.toLowerCase())) {
                                  return InkWell(
                                    child: HostelContainer(
                                      hostel: hostelModel.fromJson(data),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage(
                                                hostel: hostelModel
                                                    .fromJson(data))),
                                      );
                                    },
                                  );
                                }
                                return Container();
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
