import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookAppointment/components/todayPage.dart';
import 'package:base_project_flutter/views/bookAppointment/components/tomorrowPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VideoConsultPage extends StatefulWidget {
  const VideoConsultPage({Key? key}) : super(key: key);

  @override
  State<VideoConsultPage> createState() => _VideoConsultPageState();
}

class _VideoConsultPageState extends State<VideoConsultPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: tSecondaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Video Consult",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: isTab(context) ? 9.sp : 12.sp,
                      color: tPrimaryColor),
                ),
                Divider(
                  color: tDividerColor,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Fees",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: isTab(context) ? 9.sp : 12.sp),
                        )
                      ],
                    ),
                    Text(
                      currencySymbol + "500",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: isTab(context) ? 11.sp : 14.sp,
                          color: tPrimaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DefaultTabController(
            length: 2,
            child: Container(
              height: 93.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: tPrimaryColor,
                    indicatorWeight: 3,
                    labelColor: tBlack,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: isTab(context) ? 9.sp : 12.sp),
                    unselectedLabelColor: tBlack,
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: isTab(context) ? 9.sp : 12.sp),
                    tabs: [
                      Tab(
                        child: Text('Today'),
                      ),
                      Tab(
                        child: Text('Tomorrow'),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(children: [
                        TodayPageScreen(),
                        TomorrowPage(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
