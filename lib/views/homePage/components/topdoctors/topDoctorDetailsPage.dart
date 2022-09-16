import 'package:base_project_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/imageConstant.dart';
import '../../../../globalFuctions/globalFunctions.dart';
import '../../../../responsive.dart';
import '../../../bookAppointment/bookAppointment.dart';
import '../../../bottomSheet/bottomSheetPage.dart';

class TopDoctorDetailsPage extends StatefulWidget {
  const TopDoctorDetailsPage({Key? key}) : super(key: key);

  @override
  State<TopDoctorDetailsPage> createState() => _TopDoctorDetailsPageState();
}

class _TopDoctorDetailsPageState extends State<TopDoctorDetailsPage> {
  Widget searchWidget() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 44,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.lightBlue, width: 1.5)),
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
                      borderSide: BorderSide(color: tPrimaryColor, width: 1.5)),
                ),
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
                Text('Sort/Filters'),
                SizedBox(
                width: 5,
                ),
                Image.asset(
                  Images.FILTERS,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Doctors'),
        foregroundColor: tPrimaryColor,
        backgroundColor: tWhite,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            searchWidget(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return doctorDetailsWidget;
                },
              ),
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

  Widget get doctorDetailsWidget{
    return Column(
          children: [
            Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [tCardBoxShadow],
                            color: tWhite),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.DOCTORSPROFILE,
                                      scale: 4.7,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr.Narasimha Rao",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: isTab(context)
                                                  ? 11.sp
                                                  : 14.sp),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Dentist Specalist",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  isTab(context) ? 7.sp : 10.sp,
                                              color: tGray),
                                        ),
                                       SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "10 years Exp.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  isTab(context) ? 7.sp : 10.sp,
                                              color: tPrimaryColor),
                                        ),
                                       SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images.LOCATION,
                                              scale: 4,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Madhapur",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
                                              ),
                                            ),
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
                                              "YPR Healthcare Clinic",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Image.asset(
                                      Images.FAVOURITE,
                                      scale: 4,
                                    ))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: tSecondaryColor,
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
                                        fontSize: isTab(context) ? 7.sp : 10.sp,
                                        color: tGreen),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: 5,
                                          ),
                                          Text(
                                            "02:30 AM Today",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
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
                                            width: 5,
                                          ),
                                          Text(
                                            "10:30 AM Tomorrow",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: isTab(context)
                                                    ? 7.sp
                                                    : 10.sp,
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
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Images.DOT,
                                  scale: 3.5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  currencySymbol,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tBlack),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tBlack),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Consultation Fees",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: isTab(context) ? 7.sp : 10.sp,
                                      color: tGray),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Twl.navigateTo(context, BookAppointmentScreen(index: 1,)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  border: Border.all(),
                                      color: tGreen,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Video Consult',
                                        style: TextStyle(
                                            fontSize:
                                                isTab(context) ? 7.sp : 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: tWhite),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Twl.navigateTo(context, BookAppointmentScreen(index: 0,)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  border: Border.all(),
                                      color: tBlue,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Book Appoinment',
                                        style: TextStyle(
                                            fontSize:
                                                isTab(context) ? 7.sp : 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: tWhite),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        );
  }

}
