import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookings/appointmentbookingPage.dart';
import 'package:base_project_flutter/views/bookings/videoConsultBookingPage.dart';
import 'package:base_project_flutter/views/bottomSheet/bottomSheetPage.dart';
import 'package:base_project_flutter/views/homePage/hospitalDetailsPage/hospitalDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NearByCard extends StatefulWidget {
  const NearByCard({Key? key}) : super(key: key);

  @override
  State<NearByCard> createState() => _NearByCardState();
}

class _NearByCardState extends State<NearByCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        backgroundColor: tWhite,
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          'Hospital Near By',
          style: TextStyle(
              fontSize: isTab(context) ? 10.sp : 13.sp,
              fontWeight: FontWeight.w600,
              color: tPrimaryColor),
        ),
        leading: GestureDetector(
          onTap: () {
            Twl.navigateBack(context);
          },
          child: Image.asset(
            Images.NAVIGATEBACK,
            scale: 4,
          ),
        ),
        actions: [
          Image.asset(Images.NOTIFICATION1,scale: 4,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 43,
                      child: TextFormField(
                        decoration: InputDecoration(
                          
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.lightBlue, width: 1.5)),
                          suffixIcon: Icon(
                            Icons.search,
                            color: tPrimaryColor,
                            size: 30,
                          ),
                          labelText: 'Search',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              borderSide:
                                  BorderSide(color: tPrimaryColor, width: 1.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => displayBottomSheet(),
                    child: Container(
                      child: Row(
                        children: [
                          Text('Sort/Filters',
          style: TextStyle(
              fontSize: isTab(context) ? 6.sp : 9.sp,
              fontWeight: FontWeight.w500,
              color: tBlack),),
              SizedBox(
                width: 8,
              ),
                          Image.asset(
                            Images.FILTERS,
                            scale: 4,
                            // height: 20,
                            // width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                  child: GestureDetector(
                    onTap: () {
                      Twl.navigateTo(context, HospitalDetailsPage());
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [tCardBoxShadow],
                            color: tWhite),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          "YPR Healthcare Clinic",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  isTab(context) ? 8.sp : 11.sp),
                                        ),
                                        
                                        Text(
                                          "Medical Clinic",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  isTab(context) ? 3.sp : 9.sp,
                                              color: tGray),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                       
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images.LOCATION,
                                              scale: 3.5,
                                              color: tGray,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Madhapur",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    isTab(context) ? 6.sp : 9.sp,
                                               color: tBlack
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              Images.STAR,
                                              scale: 5,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 3),
                                              child: Text(
                                                '3.5',
                                                style: TextStyle(
                                                    fontSize: isTab(context)
                                                        ? 5.sp
                                                        : 8.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
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
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                    child: Image.asset(
                                      Images.FAVOURITE,
                                      scale: 4,
                                    ))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: tSecondaryColor,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next Available At",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 6.sp : 9.sp,
                                        color: tGreen),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.VIDEOCALL,
                                            scale: 4,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "02:30 AM Today",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    isTab(context) ? 6.sp : 9.sp,
                                                color: tGray),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.APPOINTMENT,
                                            scale: 4,
                                          ),
                                            SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "10:30 AM Tomorrow",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    isTab(context) ? 6.sp : 9.sp,
                                                color: tGray),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                           SizedBox(
                             height: 5,
                           ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  Images.DOT,
                                  scale: 4,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  currencySymbol + "500",
                                  style: TextStyle(
                                      fontSize: isTab(context) ? 6.sp : 9.sp,
                                      fontWeight: FontWeight.w600,
                                      color: tBlack),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Consultation Fees",
                                  style: TextStyle(
                                      fontSize: isTab(context) ? 6.sp : 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: tGray),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Twl.navigateTo(context, VideoConsultBookingScreen());
                                  },
                                  child: Container(
                                    // width: 160,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tGreen,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'video consult',
                                          style: TextStyle(
                                              fontSize: isTab(context) ? 7.sp : 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: tWhite),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Twl.navigateTo(context, AppointmentBookingScreen());               
                                  },
                                  child: Container(
                                    // width: 160,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30),
                                    decoration: BoxDecoration(
                                      color: tPrimaryColor,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Book Appoinment',
                                          style: TextStyle(
                                              fontSize: isTab(context) ? 7.sp : 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: tWhite),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  displayBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetPage();
      },
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )
      )
    );
  }
}
