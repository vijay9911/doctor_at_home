import 'package:base_project_flutter/constants/constants.dart';

import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookAppointment/components/bookAppointmentPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TomorrowPage extends StatefulWidget {
  const TomorrowPage({Key? key}) : super(key: key);

  @override
  State<TomorrowPage> createState() => _TomorrowPageState();
}

class _TomorrowPageState extends State<TomorrowPage> {
  List time = [
    "05:00 PM",
    "05:30 PM",
    "06:00 PM",
    "06:30 PM",
    "07:00 PM",
    "07:30 PM",
  ];

  int timeIndex = 0;

  Widget timeCardWidget() {
    return Container(
      height: 45,
      child: ListView.builder(
        itemCount: time.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                timeIndex = index;
              });
            },
            child: Card(
              color: timeIndex == index ? tPrimaryColor : tWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: [tCardBoxShadow],
                  borderRadius: BorderRadius.circular(10),
                  color: timeIndex == index ? tPrimaryColor : tWhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      time[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isTab(context) ? 9.sp : 12.sp,
                        color: timeIndex == index ? tWhite : tPrimaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
        margin: EdgeInsets.only(left: 10),
          child: timeCardWidget(),
        ),
        SizedBox(
          height: 10,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 110),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(25),
        //         border: Border.all(color: tPrimaryColor)),
        //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           "Schedule Time ",
        //           style: TextStyle(
        //             fontWeight: FontWeight.w500,
        //             fontSize: isTab(context) ? 5.sp : 8.sp,
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Image.asset(
        //           Images.EXPAND,
        //           scale: 2.5,
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: 8,
        // ),
        ClincDetailsCard(),
      ],
    );
  }
}
