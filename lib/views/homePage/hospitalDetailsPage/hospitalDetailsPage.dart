// ignore_for_file: deprecated_member_use

import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/homePage/components/topdoctors/topDoctorDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/imageConstant.dart';
import '../../../globalFuctions/globalFunctions.dart';
import '../gallery/galleryPage.dart';

class HospitalDetailsPage extends StatefulWidget {
  const HospitalDetailsPage({Key? key}) : super(key: key);

  @override
  State<HospitalDetailsPage> createState() => _HospitalDetailsPageState();
}

class _HospitalDetailsPageState extends State<HospitalDetailsPage> {
  List<String> items = [
    Images.SIMAGE1,
    Images.HOSPITAL,
    Images.SIMAGE1,
    Images.SIMAGE1,
    Images.SIMAGE1,
    Images.SIMAGE1,
  ];

  int index = 0;

  Widget carouselWidget() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 9.8 / 8.0,
        viewportFraction: 1.0,
      ),
      items: items
          .map(
            (e) => Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        e,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 220,
                      ),
                      Positioned(
                        child: Image.asset(
                          Images.FAVOURITE,
                          height: 20,
                          width: 20,
                        ),
                        top: 20,
                        left: 350,
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                        color: tWhite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'YPR Healthcare Clinic',
                                  style: TextStyle(
                                      fontSize: isTab(context) ? 13.sp : 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
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
                              ],
                            ),
                           
                            Text(
                              'Medical Clinic',
                              style: TextStyle(
                                  fontSize: isTab(context) ? 9.sp : 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: tGray),
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
                                      scale: 3,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Madhapur',
                                      style: TextStyle(
                                          fontSize: isTab(context) ? 7.sp : 10.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.DOT,
                                      scale: 3,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '2.9 Km',
                                      style: TextStyle(
                                          fontSize: isTab(context) ? 7.sp : 10.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget titleWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        color: tPrimaryColor,
        fontSize: isTab(context) ? 11.sp : 14.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget timingsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      color: tWhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Morning',
                style: TextStyle(
                  color: tGray,
                  fontSize: isTab(context) ? 9.sp : 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 165),
                child: Text(
                  'Evening',
                  style: TextStyle(
                    fontSize: isTab(context) ? 9.sp : 12.sp,
                    color: tGray,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '05.30AM - 11.30 AM',
                style: TextStyle(
                  color: tBlack,
                  fontSize: isTab(context) ? 7.sp : 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '12.30 PM - 6.30 PM',
                style: TextStyle(
                  color: tBlack,
                  fontSize: isTab(context) ? 7.sp : 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget servicesWidget(String imageUrl,String tittle) {
    return Container(

      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [tCardBoxShadow],
                color: tWhite,
                borderRadius: BorderRadius.circular(7)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      imageUrl,
                    height: 40,
                          width: 70,
                      // height: 60,
                      // width: 70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      tittle,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: isTab(context) ? 7.sp : 10.sp,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Twl.navigateTo(context, TopDoctorDetailsPage());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: tPrimaryColor)),
                    child: Text(
                      'Book',
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontSize: isTab(context) ? 8.sp : 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 320,
                    child: carouselWidget(),
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () => Twl.navigateBack(context),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    left: 10,
                    top: 10,
                  ),
                  Positioned(
                    top: 170,
                    left: 280,
                    child: GestureDetector(
                      onTap: () => Twl.navigateTo(context, GalleryPage()),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: tWhite,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        child: Row(children: [
                          Text('Gallery'),
                          SizedBox(width: 10),
                          Image.asset(
                            Images.GALLERYIMAGE,
                            height: 20,
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              titleWidget('Hospital Timings'),
              SizedBox(height: 10),
              timingsWidget(),
              SizedBox(height: 10),
              titleWidget('Appointment Timings'),
              SizedBox(height: 10),
              timingsWidget(),
              SizedBox(height: 10),
              titleWidget('Services'),
              SizedBox(height: 10),
              servicesWidget(Images.HEART,"Heart"),
              servicesWidget(Images.DENTAL,"Dental"),
              servicesWidget(Images.ANEMIA,"Anemia"),
              servicesWidget(Images.FULLBODY,"Full Body"),
              servicesWidget(Images.KIDNEY,"Kidney"),
            ],
          ),
        ),
      ),
    );
  }
}
