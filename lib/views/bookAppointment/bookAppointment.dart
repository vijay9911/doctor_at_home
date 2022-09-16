import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookAppointment/components/bookAppointmentPage.dart';
import 'package:base_project_flutter/views/bookAppointment/components/videoConsultPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen({Key? key, required this.index}) : super(key: key);

  int index = 0;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        leading: GestureDetector(
          onTap: () {
            Twl.navigateBack(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: tPrimaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Image.asset(
                  Images.STARWHITE,
                  scale: 4,
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  Images.SHARE,
                  scale: 4,
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: tWhite,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Images.DOCTORSPROFILE,
                        scale: 3,
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
                                fontSize: isTab(context) ? 13.sp : 16.sp),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Dentist",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: isTab(context) ? 6.sp : 9.sp,
                                color: tGray),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "BDS, MDS - Preventive Denstistry",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: isTab(context) ? 6.sp : 9.sp,
                                color: tGray),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "10 years Exp.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: isTab(context) ? 6.sp : 9.sp,
                                color: tPrimaryColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            DefaultTabController(
              length: 2,
              initialIndex: widget.index,
              child: Container(
                color: tWhite,
                height: 95.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: tPrimaryColor,
                      indicatorWeight: 3,
                      labelColor: tPrimaryColor,
                      labelPadding: EdgeInsets.symmetric(vertical: 10),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: isTab(context) ? 9.sp : 12.sp),
                      unselectedLabelColor: tSecondaryBlack,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isTab(context) ? 7.sp : 10.sp),
                      tabs: [
                        Tab(
                          child: Text(
                            'Book\nAppointment',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Tab(child: Text('Video\nConsult',
                        textAlign: TextAlign.center,))
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(children: [
                          BookAppointmentPage(),
                          VideoConsultPage(),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
