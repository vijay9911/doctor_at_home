import 'package:base_project_flutter/constants/constants.dart';

import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/models/servicesModel.dart';
import 'package:base_project_flutter/responsive.dart';

import 'package:base_project_flutter/views/homePage/components/topdoctors/topDoctorDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ServicesHomePage extends StatelessWidget {
  const ServicesHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        
        leading: GestureDetector(onTap: (){
          Twl.navigateBack(context);
        },
        child: Icon(Icons.arrow_back,color: tPrimaryColor,),),
        title: Text(
          'Services',
          style: TextStyle(fontWeight: FontWeight.w600,
           fontSize: isTab(context) ? 10.sp : 13.sp,),
        ),
        centerTitle: true,
        // toolbarHeight: 70,
      elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: tWhite,
        foregroundColor: tPrimaryColor,
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: Padding(
        //       padding: EdgeInsets.only(
        //         right: 10,
        //       ),
        //       child: Image.asset(Images.NOTIFICATION,scale: 4,)
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final item = DUMMY_SERVCES[index];
              return GestureDetector(
                onTap: () {
                  Twl.navigateTo(context, TopDoctorDetailsPage());
                },
                child: Card(
                  elevation: 0,
                  color: tWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                        decoration: BoxDecoration(boxShadow: [tCardBoxShadow],color: tWhite,
                         borderRadius: BorderRadius.circular(8),
                        ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            item.imageUrl,
                            height: 40,
                            width: double.maxFinite,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: isTab(context) ? 6.sp : 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
