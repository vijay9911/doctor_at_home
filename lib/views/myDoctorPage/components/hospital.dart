import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/views/bookings/appointmentBookingPage.dart';
import 'package:base_project_flutter/views/bookings/videoConsultBookingPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../responsive.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: tWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [tCardBoxShadow],
                            color: tWhite),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.HOSPITALIN,
                                      scale: 4.2,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "YPR Healthcare Clinic",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: isTab(context)
                                                  ? 11.sp
                                                  : 14.sp),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Medical Clinic",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  isTab(context) ? 7.sp : 10.sp,
                                              color: tGray),
                                        ),
                                       SizedBox(
                                          height: 3,
                                        ),
                                        
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images.LOCATION,
                                              scale: 4,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Madhapur",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
                                              ),
                                            ),
                                           
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(Images.STAR,scale: 4,),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("3.5",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: isTab(context)
                                                  ? 7.sp
                                                  : 10.sp),)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Image.asset(
                                      Images.FAVOURITE,
                                      scale: 4,
                                    ))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tSecondaryColor,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next Available At",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 7.sp : 10.sp,
                                        color: tGreen),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.VIDEOCALL,
                                            scale: 4,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "02:30 AM Today",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
                                                color: tGray),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.APPOINTMENT,
                                            scale: 4,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "10:30 AM Tomorrow",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
                                                color: tGray),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Images.DOT,
                                  scale: 3.5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  currencySymbol,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tBlack),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tBlack),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Consultation Fees",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tGray),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Twl.navigateTo(context, VideoConsultBookingScreen());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  border: Border.all(),
                                      color: tGreen,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Video Consult',
                                        style: TextStyle(
                                            fontSize:
                                                isTab(context) ? 7.sp : 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: tWhite),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Twl.navigateTo(context, AppointmentBookingScreen());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  border: Border.all(),
                                      color: tBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Book Appoinment',
                                        style: TextStyle(
                                            fontSize:
                                                isTab(context) ? 7.sp : 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: tWhite),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
