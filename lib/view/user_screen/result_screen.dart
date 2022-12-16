import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/hostel_appBarButton.dart';
import '../../components/hostel_container.dart';
import '../../components/no_internetConnection.dart';
import '../../components/search_bar.dart';
import '../../components/shimmer_hostel_container.dart';
import '../../model/hostelModel.dart';
import '../../resources/FirebaseMethods.dart';
import '../../utils/routes/RoutesName.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';
import 'add_page.dart';

class result_screen extends StatelessWidget {
  String query;
  result_screen({required this.query, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() =>
                  Navigator.pushNamed(context, RoutesName.navigation_page)
              // Navigator.pop(context)
              ),
          icon: hostel_appBarButton(
              Buttoncolor: AppColors.primaryColor,
              IconUrl: Images.whitebackButton),
          //  Container(
          //   height: 32,
          //   width: 32,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //     color: AppColors.primaryColor,
          //   ),
          //   child: Center(child: Image.asset(Images.whitebackButton)),
          // ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            search_bar(
              isReadOnly: true,
              color: AppColors.textfieldsColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20),
              child: Text(
                "Results for $query",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder(
              builder: (ctx, AsyncSnapshot<List<hostelModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return no_internetConnection();
                    // Material(
                    //   child: Contain,
                    //   // child: Text(
                    //   //   '${snapshot.error} occurred',
                    //   //   style: TextStyle(fontSize: 18),
                    //   // ),
                    // );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    //final data = snapshot.data as String;
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        // controller: _scrollViewController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdPage(
                                              hostel: snapshot.data![index])),
                                    );
                                  },
                                  child: HostelContainer(
                                    hostel: snapshot.data![index],
                                  )),
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                      ),
                    );
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return Center(
                  child: Column(
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
                  ),
                );
              },

              // Future that needs to be resolved
              // inorder to display something on the Canvas
              future: FirebaseMethods.getHostelByCategory(query: query),
            ),
          ],
        ),
      ),
    );
  }
}
