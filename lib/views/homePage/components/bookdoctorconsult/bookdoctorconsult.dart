import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/views/bookings/videoConsultBookingPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/imageConstant.dart';
import '../../../../responsive.dart';
import '../../hospitalDetailsPage/hospitalDetailsPage.dart';

class BookDoctorConsult extends StatefulWidget {
  const BookDoctorConsult({Key? key}) : super(key: key);

  @override
  State<BookDoctorConsult> createState() => _BookDoctorConsultState();
}

class _BookDoctorConsultState extends State<BookDoctorConsult> {
  List<String> nameList = [
    'Hospital Visit',
    'Video Consult',
  ];
  List<String> imageList = [
    Images.HOSPITAL,
    Images.DOCTORIMAGE,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 20),
          itemCount: nameList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Twl.navigateTo(context, HospitalDetailsPage());
                if(index == 1){
                  Twl.navigateTo(context,VideoConsultBookingScreen(),);
                }
              },
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    boxShadow: [tCardBoxShadow],
                    color: tWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        imageList[index],
                        scale: 3.5,
                        // height: 160,
                        // width: 160,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        nameList[index],
                        style: TextStyle(
                            fontSize: isTab(context) ? 11.sp : 14.sp,
                            fontWeight: FontWeight.w500,
                            color: tPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
