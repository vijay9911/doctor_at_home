import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';

import 'package:base_project_flutter/responsive.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VideoConsult extends StatefulWidget {
  const VideoConsult({Key? key}) : super(key: key);

  @override
  State<VideoConsult> createState() => _VideoConsultState();
}

class _VideoConsultState extends State<VideoConsult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [tCardBoxShadow],
                        color: tWhite),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Image.asset(
                                      Images.DOCTORSPROFILE,
                                      scale: 7,
                                    ),
                                    Positioned(
                                        right: -3,
                                        top: -2,
                                        child: Image.asset(
                                          Images.VIDEO,
                                          scale: 4,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr. Narasimha Rao",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              isTab(context) ? 9.sp : 12.sp),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Dentist",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              isTab(context) ? 6.sp : 9.sp,
                                          color: tGray),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Reschedule",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tPrimaryColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("In-Clinic Appointment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 4.sp : 7.sp,
                                        color: tGray))
                              ],
                            )
                          ],
                        ),
                        Divider(
                          color: tDividerColor,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "May 26",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: isTab(context) ? 6.sp : 9.sp,
                                      color: tGray),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("10:00-11:00 AM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 5.sp : 7.sp,
                                        color: tGray))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: tPrimaryColor)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Row(
                                children: [
                                  Text("View Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            isTab(context) ? 4.sp : 7.sp,
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    Images.EXPAND,
                                    scale: 3,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

