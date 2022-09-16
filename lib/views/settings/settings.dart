import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isVolumeSwitch = false;
  bool isVibrateSwitch = false;

  Widget nameWidgte(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isTab(context) ? 10.sp : 12.sp,
          fontWeight: FontWeight.w500,
          color: tBlackColor
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: tWhite,
        foregroundColor: tBlack,
        title: Text(
          "Settings",
          style: TextStyle(
                      fontSize: isTab(context) ? 9.sp : 12.sp,
            fontWeight: FontWeight.w600,color: tBlack,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [tCardBoxShadow],
              color: tSecondaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft:Radius.circular(15), ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        Images.NOTIFICATION2,
                        scale: 4,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Notification Settings",
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,size: 17,
                  color: tPrimaryColor,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: tSecondaryColor,
              boxShadow: [tCardBoxShadow],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft:Radius.circular(15), ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            Images.VOLUME,
                            scale: 4,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Reminder volume",
                            style: TextStyle(
                                fontSize: isTab(context) ?9.sp : 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: isVolumeSwitch,
                      onChanged: (value) {
                        setState(() {
                          isVolumeSwitch = value;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            Images.VIBRATE,
                            scale: 4,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Vibrate",
                            style: TextStyle(
                                fontSize: isTab(context) ? 9.sp : 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: isVibrateSwitch,
                      onChanged: (value) {
                        setState(() {
                          isVibrateSwitch = value;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(Images.SNOOZE, scale: 4),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Snooze Duration",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 9.sp : 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "5 minutes",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 6.sp : 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: tGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,size: 17,
                      color: tPrimaryColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Image.asset(Images.POPUP, scale: 4),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Popup Notification",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 9.sp : 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Always show popup",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 6.sp : 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: tGray),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: tPrimaryColor,size: 17,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          nameWidgte('About'),
          nameWidgte('Privacy Policy'),
          nameWidgte('Help and Support'),
          nameWidgte('Refer'),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [tCardBoxShadow],
              color: tSecondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        Images.LOGOUT,
                        scale: 4,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: tPrimaryColor,size: 17,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
