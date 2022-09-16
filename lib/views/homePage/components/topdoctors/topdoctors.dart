import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/homePage/components/topdoctors/topDoctorDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../bookAppointment/bookAppointment.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({Key? key}) : super(key: key);

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 27.h,
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 7),
              child: GestureDetector(
                onTap: () {
                  Twl.navigateTo(context, TopDoctorDetailsPage());
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [tCardBoxShadow],
                      color: tWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 60.w,
                          height: 40.h,
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 32.w,
                                child: Text(
                                  'Dr. Narasimha Rao',
                                  style: TextStyle(
                                    fontSize: isTab(context) ? 9.sp : 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Dental Specalist",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 8.sp : 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: tGray),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '10 Years Exp.',
                                style: TextStyle(
                                    fontSize: isTab(context) ? 7.sp : 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: tPrimaryColor),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Image.asset(
                                    Images.STAR,
                                    scale: 4,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '3.5',
                                    style: TextStyle(
                                        fontSize: isTab(context) ? 7.sp : 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Twl.navigateTo(
                                      context,
                                      BookAppointmentScreen(
                                        index: 0,
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: tPrimaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "Book",
                                    style: TextStyle(
                                        fontSize: isTab(context) ? 7.sp : 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: tPrimaryColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 95,
                          top: 30,
                          child: Image.asset(
                            Images.DOCTOR,
                            scale: 3.9,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
