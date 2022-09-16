// ignore_for_file: must_be_immutable, unused_field

import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';

import 'package:base_project_flutter/views/otpPage/otpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../responsive.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 11.h,
                ),
                Container(
                  // height: 30.h,
                  child: Center(
                      child: Image.asset(
                    Images.OTP,
                    scale: 3.8,
                  )
                      // FlutterLogo(
                      //   size:isTab(context)? 40.h :65.h,
                      // ),
                      ),
                ),
                SizedBox(
                  height: 6.2.h,
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: tPrimaryColor,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        Text(
                          'Enter Mobile Number',
                          style: TextStyle(
                              color: tWhite,
                              fontSize: isTab(context) ? 11.sp : 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          // height: 5.2.h,
                          child: TextFormField(
                            
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Mobile number can't be empty";
                              } else if (value.length != 10 &&
                                  value.length < 10) {
                                return 'Mobile number must be 10 digits';
                              } else {
                                return null;
                              }
                            },
                            controller: _userNameController,
                            //_phoneNumberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                fontSize: isTab(context) ? 11.sp : 14.sp,
                                color: tWhite,
                                fontWeight: FontWeight.w300),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 0),
                              // prefix: Text('+91 ',style: TextStyle(color: tBlack),),
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("IN",
                                          style: TextStyle(
                                              color: tWhite,
                                              fontSize: isTab(context)
                                                  ? 12.sp
                                                  : 15.sp,
                                              fontWeight: FontWeight
                                                  .w300)) // icon is 48px widget.
                                      ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "+91 ",
                                    style: TextStyle(
                                        color: tWhite,
                                        fontSize:
                                            isTab(context) ? 11.sp : 14.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    Images.LOGINLINE,
                                    scale: 4,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  // Icon(Icons.)
                                ],
                              ),
                              hintStyle: TextStyle(
                                  fontSize: isTab(context) ? 11.sp : 14.sp,
                                  color: tWhite,
                                  fontWeight: FontWeight.w300),
                              // hintText: '1234567890',
                              fillColor: tBorderColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: tBorderColor, width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Twl.navigateTo(context, OtpPage());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [tCardBoxShadow],
                                color: tWhite),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: isTab(context) ? 11.sp : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: tPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Once you hit continue, you'll receive a verification code.",
                                style: TextStyle(
                                  fontSize: isTab(context) ? 6.sp : 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: tWhite,
                                ),
                              ),
                              Text(
                                "The verified number can be used to log in",
                                style: TextStyle(
                                  fontSize: isTab(context) ? 6.sp : 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: tWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 5.h,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
