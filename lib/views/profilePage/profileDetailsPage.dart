import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/models/profileModel.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/profilePage/editDetailsPage.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../constants/imageConstant.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  Widget profileImageWidget() {
    return Container(
      height: 120,
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 15, right: 10, bottom: 15),
      decoration: BoxDecoration(
        color: tPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              color: tWhite,
              image: DecorationImage(
                scale: 2.5,
                image: AssetImage(Images.HEART),
              ),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: tWhite)),
        ),
      ),
    );
  }

  // Widget used(BuildContext context) {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tWhite,
        foregroundColor: tPrimaryColor,
        elevation: 1.0,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileImageWidget(),
            Container(
              height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: DUMMY_PROFILE.length,
                itemBuilder: (context, index) {
                  final items = DUMMY_PROFILE[index];
                  return GestureDetector(
                    onTap: () {
                      Twl.navigateTo(
                        context,
                        EditDetailsPage(
                          id: items.id,
                        ),
                      );
                      print(items.id);
                    },
                    child: Container(
                      margin: index == 2
                          ? EdgeInsets.only(bottom: 7)
                          : index == 5
                              ? EdgeInsets.only(bottom: 7)
                              : index == 8
                                  ? EdgeInsets.only(bottom: 7)
                                  : index == 11
                                      ? EdgeInsets.only(bottom: 7)
                                      : null,

                      // index % 3 == 0
                      //     ? index == 0
                      //         ? null
                      //         : EdgeInsets.only(bottom: 10)
                      //     : null,
                      padding: EdgeInsets.only(top: 9, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: tprofileDetailsBgColor,
                        borderRadius: index == 0
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )
                            : index == 2
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )
                                : index == 3
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )
                                    : index == 5
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          )
                                        : index == 6
                                            ? BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )
                                            : index == 8
                                                ? BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )
                                                : index == 9
                                                    ? BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      )
                                                    : index == 10
                                                        ? BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          )
                                                        : null,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items.title,
                                style: TextStyle(
                                  fontSize: isTab(context) ? 9.sp : 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: tGray,
                                ),
                              ),
                              Text(
                                items.name,
                                style: TextStyle(
                                    fontSize: isTab(context) ? 9.sp : 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          index == 0
                              ? Divider(
                                  height: 1,
                                  color: tBorderColor,
                                )
                              : index == 1
                                  ? Divider(
                                      height: 1,
                                      color: tBorderColor,
                                    )
                                  : index == 3
                                      ? Divider(
                                          height: 1,
                                          color: tBorderColor,
                                        )
                                      : index == 4
                                          ? Divider(
                                              height: 1,
                                              color: tBorderColor,
                                            )
                                          : index == 6
                                              ? Divider(
                                                  height: 1,
                                                  color: tBorderColor,
                                                )
                                              : index == 7
                                                  ? Divider(
                                                      height: 1,
                                                      color: tBorderColor,
                                                    )
                                                  : index == 9
                                                      ? Divider(
                                                          height: 1,
                                                          color: tBorderColor,
                                                        )
                                                      : Container(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
