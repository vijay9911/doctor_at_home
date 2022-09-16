import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../globalFuctions/globalFunctions.dart';
import '../../../../responsive.dart';
import '../../hospitalDetailsPage/hospitalDetailsPage.dart';

class HospitalNearBy extends StatefulWidget {
  const HospitalNearBy({Key? key}) : super(key: key);

  @override
  State<HospitalNearBy> createState() => _HospitalNearByState();
}

class _HospitalNearByState extends State<HospitalNearBy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Twl.navigateTo(context, HospitalDetailsPage()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [tCardBoxShadow],
                        color: tWhite),
                  
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
                                  scale: 4,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "YPR HealthClinic",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: isTab(context) ? 9.sp : 12.sp),
                                    ),
                                    
                                    Text(
                                      "Medical Clinic",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: isTab(context) ? 7.sp : 10.sp,
                                          color: tGray),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                   
                                    Row(
                                      children: [
                                        Image.asset(
                                          Images.LOCATION,
                                          scale: 4,
                                          color: tGray,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "Madhapur",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: isTab(context) ? 5.sp : 8.sp,
                                            color: tGray,
                                          ),
                                        ),
                                       
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          Images.STAR,
                                          scale: 4,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '3.5',
                                          style: TextStyle(
                                              fontSize:
                                                  isTab(context) ? 7.sp : 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                         SizedBox(
                                          width: 50,
                                        ),
                                        Image.asset(
                                          Images.DOT,
                                          scale: 3.5,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '2.9 Km',
                                          style: TextStyle(
                                              fontSize:
                                                  isTab(context) ? 7.sp : 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                              child: Image.asset(
                                Images.FAVOURITE,
                                scale: 4,
                              ),
                            )
                          ],
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
