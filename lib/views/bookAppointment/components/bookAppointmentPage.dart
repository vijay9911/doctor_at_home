import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookings/appointmentbookingPage.dart';
import 'package:base_project_flutter/views/bookings/videoConsultBookingPage.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  List weeks = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List dates = ["01", "02", "03", "04", "05", "06", "07"];
  List time = [
    "05:00 PM",
    "05:30 PM",
    "06:00 PM",
    "06:30 PM",
    "07:00 PM",
    "07:30 PM",
  ];

  int dateindex = 0;

  Widget datesCardWidget() {
    return Container(
      
      height: 80,
      child: ListView.builder(
        itemCount: dates.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                dateindex = index;
                print(dateindex);
              });
            },
            child: Card(
              color: dateindex == index ? tPrimaryColor : tWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: 70,
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    boxShadow: [tCardBoxShadow],
                    color: dateindex == index ? tPrimaryColor : tWhite,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      weeks[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isTab(context) ? 5.sp : 8.sp,
                        color: dateindex == index ? tWhite : tPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      dates[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: isTab(context) ? 13.sp : 16.sp,
                          color: dateindex == index ? tWhite : tPrimaryColor),
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

  int timeIndex = 0;

  Widget timeCardWidget() {
    return Container(
      height: 45,
      child: ListView.builder(
        itemCount: time.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                timeIndex = index;
              });
            },
            child: Card(
              color: timeIndex == index ? tPrimaryColor : tWhite,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        fontSize: isTab(context) ? 10.sp : 12.sp,
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: tSecondaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "In-Clinic Appointment",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: isTab(context) ? 8.sp : 11.sp,
                      color: tPrimaryColor),
                ),
                Divider(
                  color: tDividerColor,
                  thickness: 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Images.APPOINTMENT,
                          scale: 4,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Fees",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: isTab(context) ? 8.sp : 11.sp),
                        )
                      ],
                    ),
                    Text(
                      currencySymbol + "500",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: isTab(context) ? 11.sp : 14.sp,
                          color: tPrimaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Schedule Date & Time",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: tGray,
                    fontSize: isTab(context) ? 7.sp : 10.sp)),
          ),
          
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                //        DatePicker(
                //   DateTime.now(),
                //   initialSelectedDate: DateTime.now(),
                //   width: 80,
                //   selectionColor: tPrimaryColor,
                //   selectedTextColor: tWhite,
                //   onDateChange: (date) {
                //     // New date selected
                //     setState(() {
                //         var _selectedValue = date;
                //     });
                //   },
                // ),
                Column(
              children: [
                
                datesCardWidget(),
                SizedBox(
                  height: 10,
                ),
                timeCardWidget(),
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
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          ClincDetailsCard(),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class ClincDetailsCard extends StatelessWidget {
  const ClincDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clinic Details",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: isTab(context) ? 9.sp : 12.sp,
                color: tPrimaryColor),
          ),
          Divider(
            color: tDividerColor,
            thickness: 1,
          ),
          Text("YPR Healthcare Clinic",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTab(context) ? 9.sp : 12.sp,
              )),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Medical Clinic",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      color: tGray)),
              Row(
                children: [
                  Image.asset(
                    Images.STAR,
                    scale: 4,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("3.5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isTab(context) ? 7.sp : 10.sp,
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    Images.LOCATION,
                    scale: 4,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Ayyapa Society, Madhapur, Telangana",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isTab(context) ? 6.sp : 9.sp,
                          color: tGray))
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    Images.DOT,
                    scale: 4,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("2.9 Km",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isTab(context) ? 6.sp : 9.sp,
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Timings",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: isTab(context) ? 9.sp : 12.sp,
                color: tPrimaryColor),
          ),
          Divider(
            color: tDividerColor,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: isTab(context) ? 7.sp : 10.sp,
                        color: tGray),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "05:21 AM - 11:30 AM",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 6.sp : 9.sp,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evening",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: isTab(context) ? 7.sp : 10.sp,
                        color: tGray),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "12:30 PM - 06:30 PM",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 6.sp : 9.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Services by Dr. Narasimha Rao",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: isTab(context) ? 9.sp : 12.sp,
                color: tPrimaryColor),
          ),
          Divider(
            color: tDividerColor,
            thickness: 1,
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    Images.DOT,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Acrylic Partial Denture",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isTab(context) ? 6.sp : 9.sp,
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    Images.DOT,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Impaction / Impacted Tooth Extraction",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isTab(context) ?6.sp : 9.sp,
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    Images.DOT,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Cast Partial Denture",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isTab(context) ?6.sp : 9.sp,
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Twl.navigateTo(context, VideoConsultBookingScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    //  border: Border.all(),
                    color: tGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Center(
                    child: Text(
                      'Video Consult',
                      style: TextStyle(
                          fontSize: isTab(context) ? 7.sp : 10.sp,
                          fontWeight: FontWeight.w600,
                          color: tWhite),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Twl.navigateTo(context, AppointmentBookingScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    //  border: Border.all(),
                    color: tBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Center(
                    child: Text(
                      'Book Appoinment',
                      style: TextStyle(
                          fontSize: isTab(context) ? 7.sp : 10.sp,
                          fontWeight: FontWeight.w600,
                          color: tWhite),
                    ),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: 170,
          // )
        ],
      ),
    );
  }
}

// class TimeCard extends StatelessWidget {
//   const TimeCard({
//     Key? key,
//     required this.time,
//   }) : super(key: key);

//   final List time;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: 
//     );
//   }
// }

// class DatesCard extends StatelessWidget {
//   const DatesCard({
//     Key? key,
//     required this.weeks,
//     required this.dates,
//   }) : super(key: key);

//   final List weeks;
//   final List dates;

//   @override
//   Widget build(BuildContext context) {
//     return );
//   }
// }
