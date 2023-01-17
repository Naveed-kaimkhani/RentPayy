import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentpayy/components/authButton.dart';
import 'package:rentpayy/components/payment_button.dart';

import '../../components/hostel_appBarButton.dart';
import '../../model/hostelModel.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/style/Images.dart';

class book_now extends StatefulWidget {
  final hostelModel? hostel;
  book_now({Key? key, required this.hostel}) : super(key: key);

  @override
  State<book_now> createState() => _book_nowState();
}

class _book_nowState extends State<book_now> {
  void initState() {
    payments.add(Payment("Jazzcash", false, "asset/easypaisa.png"));
    payments.add(Payment("Easypaisa", false, "asset/jazzcash.png"));
    payments.add(Payment("male", false, "asset/bank.png"));

    super.initState();
  }

  List<Payment> payments = <Payment>[];
  List<String> plan = [" 1 month", " 3 months", " 6 months", " 1 year"];
  int increment = 0;
  int value = 0;
  String? selectedvalue = " Per month";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: hostel_appBarButton(
              Buttoncolor: AppColors.primaryColor,
              IconUrl: Images.whitebackButton),
        ),
        centerTitle: true,
        title: Text(
          "Book Now",
          style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            SizedBox(
              height: 38.h,
            ),
            Container(
              height: 283.h,
              width: 392.w,
              decoration: BoxDecoration(
                color: AppColors.textfieldsColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.hostel!.name!,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset("asset/stars.png"),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                widget.hostel!.hostel_address!,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 110.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 3.81, right: 3.81),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        width: 20.8.w,
                                        height: 20.8.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Container(
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (increment == 0) {
                                            increment = 0;
                                          } else {
                                            increment--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      increment.toString(),
                                      style: TextStyle(fontSize: 17.sp),
                                    ),
                                    InkWell(
                                      child: Container(
                                        width: 20.8.w,
                                        height: 20.8.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Container(
                                          child: Icon(
                                            Icons.add,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          increment++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            StatefulBuilder(builder: (context, setState) {
                              return Container(
                                width: 120.w,
                                height: 45.h,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    buttonElevation: 0,
                                    dropdownElevation: 0,
                                    itemHeight: 40.h,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.primaryColor,
                                    ),
                                    hint: Text(
                                      selectedvalue!,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17.sp),
                                    ),
                                    buttonWidth: 100,
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.textfieldsColor),
                                    items: plan
                                        .map(
                                          (value) => DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.sp),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedvalue = value as String;
                                      });
                                    },
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              width: 110.w,
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: widget.hostel!.charges!.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryColor)),
                                TextSpan(
                                    text: " Rs",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black)),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal x $increment",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          (widget.hostel!.charges! * increment)
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor)),
                                  TextSpan(
                                      text: " Rs",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 26.sp, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 112.w,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          (widget.hostel!.charges! * increment)
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor)),
                                  TextSpan(
                                      text: " Rs",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 19.h,
            ),
            Container(
              height: 210.h,
              width: 392.w,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        payments
                            .forEach((payments) => payments.isSelected = false);
                        payments[index].isSelected = true;
                      });
                    },
                    child: CustomRadio(payments[index]),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
            authButton(
                text: "Continue to Payment",
                func: () {},
                color: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}

class Payment {
  String name;
  String image;
  bool isSelected;

  Payment(this.name, this.isSelected, this.image);
}

class CustomRadio extends StatelessWidget {
  Payment _payment;

  CustomRadio(this._payment);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.textfieldsColor,
          borderRadius: BorderRadius.circular(10.r)),
      height: 61.h,
      width: 392.w,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              Image.asset(_payment.image),
              SizedBox(
                width: 14.w,
              ),
              Text(
                _payment.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 20.h,
              width: 20.w,
              child: _payment.isSelected
                  ? Image.asset("asset/radiobutton_colored.png")
                  : Image.asset("asset/radiobutton.png"),
            ),
          ),
        ],
      ),
    );
  }
}
