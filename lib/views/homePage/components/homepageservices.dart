// ignore_for_file: unused_local_variable

import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';

import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/homePage/components/servicesHome.dart';
import 'package:base_project_flutter/views/homePage/components/topdoctors/topDoctorDetailsPage.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/imageConstant.dart';


class HomePageServices extends StatelessWidget {
  const HomePageServices({Key? key}) : super(key: key);

  Widget servicesCardWidget(
      BuildContext context, String imageUrl, String title, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          Twl.navigateTo(context, ServicesHomePage());
        } else {
          Twl.navigateTo(context, TopDoctorDetailsPage());
        }
      },
      child: Card(
        elevation: 0,
        color: tWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [tCardBoxShadow],
            color: tWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  imageUrl,
                  height: 35,
                  width: 16.w,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isTab(context) ? 7.sp : 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          servicesCardWidget(context, Images.HEART, 'Heart', 0),
          servicesCardWidget(context, Images.DENTAL, 'Dental', 1),
          servicesCardWidget(context, Images.BRAIN, 'Brain', 2),
          servicesCardWidget(context, Images.SEEALL, 'See all', 3),
        ],
      ),
      height: 11.h,
      // margin: EdgeInsets.only(left: 20),
      // child: ListView.builder(
      //   shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 12,
      //   itemBuilder: (context, index) {
      //     final item = DUMMY_SERVCES[index];
      //     return GestureDetector(
      //       onTap: () {
      //         Twl.navigateTo(context, HospitalDetailsPage());
      //       },
      //       child: Card(
      //         elevation: 0,
      //         color: tWhite,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(5),
      //         ),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             boxShadow: [tCardBoxShadow],
      //             color: tWhite,
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(10.0),
      //                 child: Image.asset(
      //                   item.imageUrl,
      //                   height: 40,
      //                   width: 70,
      //                 ),
      //               ),
      //               Expanded(
      //                 child: Text(
      //                   item.title,
      //                   style: TextStyle(
      //                     fontSize: isTab(context) ? 9.sp : 12.sp,
      //                     fontWeight: FontWeight.w400,
      //                   ),
      //                   overflow: TextOverflow.ellipsis,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
