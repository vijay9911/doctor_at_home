import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/views/homePage/components/bookdoctorconsult/bookdoctorconsult.dart';
import 'package:base_project_flutter/views/homePage/components/homepageservices.dart';
import 'package:base_project_flutter/views/homePage/components/hospitalnearby/hospitalnearby.dart';
import 'package:base_project_flutter/views/homePage/components/nearbycard.dart';
import 'package:base_project_flutter/views/homePage/components/topdoctors/topdoctors.dart';
import 'package:base_project_flutter/views/homePage/drawer.dart';
import 'package:base_project_flutter/views/homePage/hospitalDetailsPage/hospitalDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../responsive.dart';

import 'components/topdoctors/topDoctorDetailsPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget titleWidget(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: isTab(context) ? 10.sp : 13.sp,
          fontWeight: FontWeight.w500,
          color: tBlue),
    );
  }

  Widget viewallWidget(BuildContext context, VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Text(
        "View all",
        style: TextStyle(
            fontSize: isTab(context) ? 7.sp : 10.sp, fontWeight: FontWeight.w400),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
         appBar: AppBar(
        backgroundColor: tWhite,
        foregroundColor: tPrimaryColor,
        elevation: 0,
        // leading: Image.asset(
        //   Images.MENU,
        //   scale: 4,
        // ),
        

        centerTitle: true,
      title: Image.asset(Images.MEDICOLOGO,scale: 3.8,),
        actions: [
          
          GestureDetector(
            onTap: () {
              
            },
            child: Image.asset(
              Images.NOTIFICATION,
              scale: 4,
            ),
          ),
        ],
      ),
       drawer: DrawerPage(),
          body: SafeArea(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [tCardBoxShadow],color: tWhite,
                       borderRadius: BorderRadius.circular(20),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Hi Avinash',
                            style: TextStyle(
                                fontSize: isTab(context) ? 13.sp : 16.sp,
                                fontWeight: FontWeight.w400,
                                color: tBlack),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'How are you today?',
                            style: TextStyle(
                                fontSize: isTab(context) ? 7.sp : 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Find Your Speclist',
                                style: TextStyle(
                                    fontSize: isTab(context) ? 16.sp : 19.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                               Text(
                                'Doctor',
                                style: TextStyle(
                                    fontSize: isTab(context) ? 16.sp : 19.sp,
                                    fontWeight: FontWeight.w500,color: tPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  Image.asset(Images.HOMEPAGEBANNER),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: tWhite,
                                  ),
                                  boxShadow: [tCardBoxShadow],color: tWhite,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: isTab(context) ? 20 : 10,
                                        horizontal: 10),
                                    suffixIcon: Image.asset(
                                      Images.SEARCH,
                                      scale: 4,
                                    ),
                                    fillColor: Colors.transparent,
                                    focusColor: tBlack,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.5),
                                        borderRadius: BorderRadius.circular(30)),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color: tlightGray,
                                        fontSize: isTab(context) ? 8.sp : 12.sp,
                                        fontWeight: FontWeight.w600,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.2.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(context, 'Services'),
                    // viewallWidget(context, () {
                    //   Twl.navigateTo(context, ServicesPage());
                    // }),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0),
                child: HomePageServices(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(context, 'Top Doctors'),
                    viewallWidget(context, () {
                      Twl.navigateTo(context, TopDoctorDetailsPage(),);
                    }),
                  ],
                ),
              ),
              TopDoctors(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(context, 'BookDoctorConsult'),
                    viewallWidget(context, () {
                      Twl.navigateTo(context, HospitalDetailsPage());
                    }),
                  ],
                ),
              ),
              BookDoctorConsult(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget(context, 'Hospital Near by'),
                    viewallWidget(context, () {
                      Twl.navigateTo(context, NearByCard());
                    }),
                  ],
                ),
              ),
              HospitalNearBy(),
            ],
          ),
        ),)
    );
    // return Scaffold(
    //   backgroundColor: tWhite,
    //   appBar: AppBar(
    //     backgroundColor: tWhite,
    //     foregroundColor: tPrimaryColor,
    //     elevation: 0,
    //     // leading: Image.asset(
    //     //   Images.MENU,
    //     //   scale: 4,
    //     // ),

    //     centerTitle: true,
    //     // title:Row(
    //     //   children: [
    //     //     // Image.asset(Images.LOCATION,scale: 4,),
    //     //     // SizedBox(
    //     //     //   width: 1.h,
    //     //     // ),
    //     //     // Text('Ayyappa Society Mian Road',style: TextStyle(
    //     //     //   fontSize:isTab(context) ? 20 :  12.sp,fontWeight: FontWeight.w700,color: tWhite
    //     //     // ),)
    //     //   ],
    //     // ),
    //     actions: [
    //       Image.asset(
    //         Images.NOTIFICATION,
    //         scale: 4,
    //       ),
    //     ],
    //   ),
    //  
   
    // );
  }
}
