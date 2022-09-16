import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




class EXaminationScreen extends StatefulWidget {
  const EXaminationScreen({Key? key}) : super(key: key);

  @override
  State<EXaminationScreen> createState() => _EXaminationScreenState();
}

class _EXaminationScreenState extends State<EXaminationScreen> {
  List images = ["assets/icons/checking.png", "assets/icons/scanning.png"];
  List names = ["Phyiscal Examination", "MRI Examination"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [tCardBoxShadow],
                      color: tWhite),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(names[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: isTab(context) ? 9.sp : 12.sp,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Image.asset(
                            images[index],
                            scale: 4,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Reschedule",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: isTab(context) ? 8.sp : 11.sp,
                                color: tPrimaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "May 26",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: isTab(context) ? 7.sp : 10.sp,
                                color: tGray),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("10:00-11:00 AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTab(context) ? 5.sp : 8.sp,
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
              );
            }),
      ),
    );
  }
}
