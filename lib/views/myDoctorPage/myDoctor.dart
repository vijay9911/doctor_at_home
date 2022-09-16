import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/responsive.dart';

import 'package:base_project_flutter/views/myDoctorPage/components/doctor.dart';
import 'package:base_project_flutter/views/myDoctorPage/components/hospital.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyDoctorScreen extends StatefulWidget {
  const MyDoctorScreen({ required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  State<MyDoctorScreen> createState() => _MyDoctorScreenState();
}

class _MyDoctorScreenState extends State<MyDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        centerTitle: true,
        title: Text(
          'My Doctors',
          style: TextStyle(
              fontSize: isTab(context) ? 11.sp : 14.sp,
              fontWeight: FontWeight.w600,
              color: tBlack),
        ),
      ),
      body: DefaultTabController(
        initialIndex: widget.index,
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                  color: tTabBarColor,
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: tPrimaryColor,
                      indicatorWeight: 3,
                      labelColor: tPrimaryColor,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: isTab(context) ? 11.sp : 14.sp),
                      unselectedLabelColor: tBlack,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isTab(context) ? 11.sp : 14.sp),
                      tabs: [
                        Tab(
                          text: "Doctors",
                        ),
                        Tab(
                          text: "Hospitals",
                        )
                      ])),
              Expanded(
                  child: Container(
                child: TabBarView(children: [
                 DoctorScreen(),
                 HospitalScreen(),
                ]),
              ))
            ],
          )),
    );
  }
}
