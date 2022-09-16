import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/recordsPage/components/examination.dart';
import 'package:base_project_flutter/views/recordsPage/components/prescription.dart';
import 'package:base_project_flutter/views/recordsPage/components/test.dart';
import 'package:base_project_flutter/views/recordsPage/components/visit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        leading: GestureDetector(onTap: () {
          Twl.navigateBack(context);
        },child: Image.asset(Images.NAVIGATEBACK,scale: 4,),),
        title: Text(
          'Records',
          style: TextStyle(
            fontSize: isTab(context) ? 9.sp : 12.sp,
            fontWeight: FontWeight.w600,color: tBlack
          ),
        ),
      ),
      body: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              Container(
                  color: tTabBarColor,
                  child: TabBar(
                      isScrollable: true,
                      onTap: (value) {
                        print(value);
                      },
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: tPrimaryColor,
                      indicatorWeight: 3,
                      labelColor: tPrimaryColor,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: isTab(context) ? 9.sp : 12.sp),
                      unselectedLabelColor: tBlack,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isTab(context) ? 9.sp : 12.sp),
                      tabs: [
                        Tab(
                          text: "Visit",
                        ),
                        Tab(
                          text: "Examination",
                        ),
                        Tab(
                          text: "Test",
                        ),
                        Tab(
                          text: "Pescription",
                        )
                      ])),
              Expanded(
                  child: Container(
                child: TabBarView(children: [
                  VisitScrren(),
                  EXaminationScreen(),
                  TestScreen(),
                  PrescriptionScreen(),
                ]),
              ))
            ],
          )),
    );
  }
}
