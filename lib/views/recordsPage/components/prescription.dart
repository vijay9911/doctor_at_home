import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';

import 'package:base_project_flutter/responsive.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Images.MEDICINE,
                            scale: 5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pharyngitis Recipe",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isTab(context) ? 9.sp : 12.sp,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Dr.Narasimha Rao",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isTab(context) ? 5.sp : 8.sp,
                                    color: tGray),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Given At",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isTab(context) ? 5.sp : 8.sp,
                                color: tGray),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("26th May 2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: isTab(context) ? 7.sp : 10.sp,
                                  color: tGray)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: tPrimaryColor)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              children: [
                                Text("View Report",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: isTab(context) ? 5.sp : 8.sp,
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
            ))
          ],
        ),
      ),
    );
  }
}
