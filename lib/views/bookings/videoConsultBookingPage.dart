import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../profilePage/componnts/paymentmethod.dart';

class VideoConsultBookingScreen extends StatefulWidget {
  const VideoConsultBookingScreen({Key? key}) : super(key: key);

  @override
  State<VideoConsultBookingScreen> createState() =>
      _VideoConsultBookingScreenState();
}

class _VideoConsultBookingScreenState extends State<VideoConsultBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        title: Text(
          "Book Video Consultation ",
          style: TextStyle(
              color: tBlack,
              fontWeight: FontWeight.w600,
              fontSize: isTab(context) ? 9.sp : 12.sp),
        ),
        leading: GestureDetector(
          onTap: () {
            Twl.navigateBack(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: tPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: tWhite,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Images.DOCTORSPROFILE,
                          scale: 6.5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr.Narasimha Rao",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTab(context) ? 9.sp : 12.sp),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Dentist",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: isTab(context) ? 6.sp : 9.sp,
                                  color: tGray),
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      Images.VIDEO,
                      scale: 2.5,
                    )
                  ],
                ),
              ),
              Container(
                color: tWhite,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Appointment Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: isTab(context) ? 9.sp : 12.sp,
                              color: tPrimaryColor),
                        ),
                        Text(
                          "26th May 7:00 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: isTab(context) ? 6.sp : 9.sp,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: tDividerColor,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Images.LOCATION,
                          scale: 3.5,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "YPR Healthcare Clinic, Madhapur",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 6.sp : 9.sp,
                              color: tGray),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: tPrimaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "APPLY CODE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: isTab(context) ? 6.sp : 9.sp,
                                    color: tGray),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Icon(
                                Icons.expand_more,
                                color: tPrimaryColor,
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: tBlue,
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                          child: Text(
                            "Apply Coupon",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ?  6.sp : 9.sp,
                                color: tWhite),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bill Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: isTab(context) ? 9.sp : 12.sp,
                          color: tPrimaryColor),
                    ),
                    Divider(
                      thickness: 1,
                      color: tDividerColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Consultation Fee",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ? 6.sp : 9.sp,
                                color: tGray)),
                        Text(currencySymbol + "500",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 9.sp : 12.sp,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax charges ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ?  6.sp : 9.sp,
                                color: tGray)),
                        Text(currencySymbol + "50",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 9.sp : 12.sp,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Booking Fee",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ?  6.sp : 9.sp,
                                color: tGray)),
                        Text(currencySymbol + "300",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 9.sp : 12.sp,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(Images.LINE),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payable",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 9.sp : 12.sp,
                            )),
                        Text(currencySymbol + "850",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ? 9.sp : 12.sp,
                                color: tPrimaryColor))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [tCardBoxShadow],
                            borderRadius: BorderRadius.circular(10),
                            color: tWhite,
                            image:  DecorationImage(
                              image: AssetImage(Images.SAFTEY),
                              scale: 3.5,
                            )
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Safety Measures followed by clinic",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: isTab(context) ? 8.sp : 11.sp,
                                      color: tPrimaryColor)),
                              Divider(
                                color: tDividerColor,
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.DOT,
                                    scale: 3.5,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Mask mandatory",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: isTab(context) ? 6.sp : 9.sp,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.DOT,
                                    scale: 3.5,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Temperature check at the entrance",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: isTab(context) ? 6.sp : 9.sp,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.DOT,
                                    scale: 3.5,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Social Distance maintained",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: isTab(context) ?  6.sp : 9.sp,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Twl.navigateTo(context, PaymentMethod());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: tPrimaryColor,
                            boxShadow: [tCardBoxShadow],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                          child: Center(
                            child: Text("Proceed to Pay",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: isTab(context) ? 9.sp : 12.sp,
                                    color: tWhite)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
