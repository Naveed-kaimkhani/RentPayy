import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rentpayy/utils/style/AppColors.dart';
import 'package:rentpayy/utils/style/text_style.dart';
import 'package:rentpayy/utils/utils.dart';
import 'package:rentpayy/view/Hostel_Screen/edit_facilities.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/GenderDropdown_button.dart';
import '../../components/HostelDropdown_button.dart';
import '../../components/circle_progress.dart';
import '../../components/hostel_appBarButton.dart';
import '../../components/quantity_box.dart';
import '../../model/hostelModel.dart';
import '../../resources/FirebaseMethods.dart';
import '../../utils/routes/RoutesName.dart';
import '../../utils/style/Images.dart';
import '../../view_model/HostelDetailsProvider.dart';
import '../user_screen/facility_container.dart';

class ads_edit_screen extends StatefulWidget {
  const ads_edit_screen({super.key});
  @override
  State<ads_edit_screen> createState() => _ads_edit_screenState();
}

class _ads_edit_screenState extends State<ads_edit_screen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _DescriptionController = TextEditingController();

  final users = FirebaseFirestore.instance.collection('hostels');
  List<XFile>? imageFileList = [];
  final FirebaseMethods _firebaseMethods = FirebaseMethods();
  var selectedIndex = 0;
  bool isLoadingNow = false;
  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  Future<void> updateData(
      {required String hostelName,
      required int available_capacity,
      required int person_per_room,
      required int total_capacity,
      required String Description}) {
    final uid = utils.currentUserUid;
    return users
        .doc(uid)
        .update({
          "name": hostelName,
          "available_capacity": available_capacity,
          "person_per_room": person_per_room,
          "total_capacity": total_capacity,
          "description": Description,

          // "profile_image": _profileImage,
        })
        .then((value) => {
              utils.toastMessage('Profile Updated'),
              Navigator.pushNamed(context, RoutesName.SellerDashboard),
              debugPrint('Data updated'),
            })
        .onError((error, stackTrace) => {
              utils.flushBarErrorMessage(error.toString(), context),
              //  print(error.toString()),
            });
  }

  Future<void> selectImages() async {
    final selectedImaged = await ImagePicker().pickMultiImage();

    if (selectedImaged.length > 8) {
      utils.flushBarErrorMessage("only 8 pictures are allowed", context);
    } else if (selectedImaged.length < 8) {
      utils.flushBarErrorMessage("select atleast 8 pictures", context);
    } else if (selectedImaged.isNotEmpty) {
      imageFileList!.addAll(selectedImaged);
      setState(() {
        imageFileList;
      });
      saveImagestoFirebaseStorage();
    } else {
      utils.flushBarErrorMessage("Pictures not selected", context);
    }
  }

  void saveImagestoFirebaseStorage() async {
    // utils.toastMessage("Please wait it may take some time");

    utils.showLoading(context);
    List<String> listOfImages = await _firebaseMethods.updateHostelsImage(
        imageFile: imageFileList!, uid: utils.currentUserUid);
    updateModel(listOfImages);
  }

  void updateModel(List<String> images) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("hostels").doc(utils.currentUserUid).update({
      'pictures': images,
    }).then((value) async {
      await _getHostelDetails(utils.currentUserUid);
      utils.toastMessage("Pictures Updated");
    });
  }

  Future<void> _getHostelDetails(String uid) async {
    hostelModel? hostel;
    hostel = await Provider.of<HostelDetailsProvider>(context, listen: false)
        .getHostelFromServer(uid, context);
    // isLoading(false);
    if (hostel != null) {
      utils.hideLoading();
      Navigator.pushNamed(context, RoutesName.SellerDashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    hostelModel? hostel =
        Provider.of<HostelDetailsProvider>(context, listen: false)
            .hostelDetails;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, RoutesName.SellerDashboard);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 50,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Edit Ad",
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            onPressed: (() =>
                Navigator.pushNamed(context, RoutesName.SellerDashboard)),
            icon: hostel_appBarButton(
              Buttoncolor: AppColors.primaryColor,
              IconUrl: Images.whitebackButton,
            ),
            // SvgPicture.asset('asset/backIcon.png')
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      onPageChanged: (index, reason) => setState(() {
                            selectedIndex = index;
                          }),
                      // height: 400.h,
                      height: 250.h,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      // autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4)),
                  itemCount: hostel!.pictures!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      CachedNetworkImage(
                    imageUrl: hostel.pictures![itemIndex],
                    imageBuilder: (context, imageProvider) => Container(
                      // width: 428.w,
                      // height: 469.h,
                      width: 400.w,
                      height: 440.h,
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        ),

                        // shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      widthFactor: 2.0,
                      heightFactor: 2.0,
                      // child: CircularProgressIndicator()
                      child: circle_progress(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // SizedBox(
                //   height: .h,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 110.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: selectedIndex,
                        count: hostel.pictures!.length,
                        effect: WormEffect(
                          dotWidth: 8.w,
                          dotHeight: 8.h,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: Color.fromARGB(255, 177, 167, 167),
                        ),
                        duration: Duration(milliseconds: 700),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      TextButton(
                          onPressed: () {
                            selectImages();
                          },
                          child: Text(
                            "Update Images",
                            style: TextStyle(
                                fontSize: 12.sp, color: AppColors.primaryColor),
                          ))
                    ],
                  ),
                ),

                ///////////////
                SizedBox(
                  height: 20,
                ),
                // Text With Underline
                Text(
                  hostel.name!,
                  style: CustomTextStyle.headingsAll,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 240.w,
                      child: Divider(
                        color: Colors.black,
                        indent: 2.0,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                      onTap: () async {
                        openDialogue().then((value) {
                          if (value != null && value.isNotEmpty) {
                            setState(() {
                              hostel.name = value;
                            });
                          }
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                // Drop Down menu
                Row(
                  children: [
                    HostelDropdown_button(
                      list: [
                        'Bachelor Hostel',
                        'Hospital Hostel',
                        'Etc Hostel',
                      ],
                      hinttext: hostel.hostel_type,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GenderDropdown_button(
                      list: [
                        'Male',
                        'Female',
                      ],
                      hinttext: hostel.hostel_gender_type,
                    ),
                  ],
                ),

                // Table Selected Dropdown Value
                SizedBox(
                  height: 30.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Capacity',
                          style: CustomTextStyle.font_black_w500,
                        ),
                        StatefulBuilder(
                          builder: (context, myStatefunc) {
                            return QuanityBox(
                              Quantity: hostel.total_capacity!,
                              minus: () {
                                myStatefunc(() {
                                  hostel.total_capacity =
                                      (hostel.total_capacity! - 1);
                                });
                              },
                              plus: () {
                                myStatefunc(() {
                                  hostel.total_capacity =
                                      (hostel.total_capacity! + 1);
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 55.w,
                    ),
                    Column(
                      children: [
                        Text(
                          'Available Capacity',
                          style: CustomTextStyle.font_black_w500,
                        ),
                        StatefulBuilder(
                          builder: (context, myStatefunc) {
                            return QuanityBox(
                              Quantity: hostel.available_capacity!,
                              minus: () {
                                myStatefunc(() {
                                  hostel.available_capacity =
                                      (hostel.available_capacity! - 1);
                                });
                              },
                              plus: () {
                                myStatefunc(() {
                                  hostel.available_capacity =
                                      (hostel.available_capacity! + 1);
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Persons per Room',
                          style: CustomTextStyle.font_black_w500,
                        ),
                        StatefulBuilder(
                          builder: (context, myStatefunc) {
                            return QuanityBox(
                              Quantity: hostel.person_per_room!,
                              minus: () {
                                myStatefunc(() {
                                  hostel.person_per_room =
                                      (hostel.person_per_room! - 1);
                                });
                              },
                              plus: () {
                                myStatefunc(() {
                                  hostel.person_per_room =
                                      (hostel.person_per_room! + 1);
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 55.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Facilities',
                      style: CustomTextStyle.font_black_w500,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => edit_facilities()));
                        },
                        child: Text(
                          "edit",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: AppColors.primaryColor),
                        ))
                  ],
                ),
                // Grid View
                GridView.count(
                  padding: EdgeInsets.zero,

                  shrinkWrap: true,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,

                  physics: new NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  children: hostel.facilities!
                      .map<Widget>(
                        (e) => facility_container(text: e),
                      )
                      .toList(),
                  //  childAspectRatio: 1.1,
                ),
                // Description
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: CustomTextStyle.font_black_w500,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                        color: AppColors.greyBackgroundCOlor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                        onSubmitted: (_) {
                          if (_DescriptionController.text != null &&
                              _DescriptionController.text.isNotEmpty) {
                            setState(() {
                              hostel.description = _DescriptionController.text;
                            });
                          }
                        },
                        controller: _DescriptionController,
                        maxLength: 250,
                        // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hostel.description),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4)),
                // Save Changes Button
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 321.w,
                  height: 67.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () async {
                        await updateData(
                            hostelName: hostel.name!,
                            person_per_room: hostel.person_per_room!,
                            available_capacity: hostel.available_capacity!,
                            total_capacity: hostel.total_capacity!,
                            Description: hostel.description!);
                      },
                      child: Text("Save Changes")),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> openDialogue() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Change Name"),
            content: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Change Name",
              ),
            ),
            actions: [TextButton(onPressed: submit, child: Text("submit"))],
          ));
  void submit() {
    Navigator.of(context).pop(_controller.text);
    print(_controller.text);
    _controller.clear();
  }
}
