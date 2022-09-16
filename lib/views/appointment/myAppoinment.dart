import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/appointment/components/appointment.dart';
import 'package:base_project_flutter/views/appointment/components/videoConsult.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        foregroundColor: tPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'My Appointments',
          style: TextStyle(
              fontSize: isTab(context) ? 9.sp : 12.sp,
              fontWeight: FontWeight.w600,
              color: tBlack
              ),
        ),
      ),
      body: DefaultTabController(
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
                          fontSize: isTab(context) ? 9.sp : 12.sp,),
                      unselectedLabelColor: tBlack,
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isTab(context) ?9.sp : 12.sp,),
                      tabs: [
                        Tab(
                          text: "Appointments",
                        ),
                        Tab(
                          text: "Video consult",
                        )
                      ])),
              Expanded(
                  child: Container(
                child: TabBarView(children: [
                  Appointment(),
                  VideoConsult(),
                ]),
              ))
            ],
          )),
    );
  }
}
