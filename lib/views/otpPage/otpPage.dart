// ignore_for_file: must_be_immutable

import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';

import 'package:base_project_flutter/views/locationPage/locationPage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../responsive.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);
  final TextEditingController _otpCodeController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  late String username;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // height: 65.h,
                  child: Center(
                      child: Image.asset(
                    Images.LOGIN,
                    scale: 3.7,
                  )),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    margin: EdgeInsets.only(top: 20,),
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
                        Text(
                          'Enter OTP',
                          style: TextStyle(
                              color: tWhite,
                              fontSize: isTab(context) ? 13.sp : 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        PinCodeTextField(
                          //backgroundColor: Colors.white,
                          appContext: context,
                          textStyle: TextStyle(
                            color: tWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: isTab(context) ? 16.sp : 19.sp,
                          ),
                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',

                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 6 || v.length == 0) {
                              return "OTP length did't match";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            activeColor: tBorderColor,
                            selectedColor: tBorderColor,
                            selectedFillColor: tBorderColor,
                            inactiveFillColor: tBorderColor,
                            inactiveColor: tBorderColor,
                            borderRadius: BorderRadius.circular(12),
                            fieldHeight: isTab(context) ? 9.w : 12.w,
                            fieldWidth: isTab(context) ? 9.w : 12.w,
                            activeFillColor:
                                hasError ? tBorderColor : tBorderColor,
                          ),
                          cursorColor: tBlack,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          //errorAnimationController: errorController,
                          controller: _otpCodeController,
                          keyboardType: TextInputType.number,
                          boxShadows: [tBoxShadow],
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onTap: () {
                            print("Pressed");
                          },
                          onChanged: (value) {
                            print(value);
                            // setState(() {
                            //   currentText = value;
                            // });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");

                            return true;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Twl.navigateTo(context, LocationScreen());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [tCardBoxShadow],
                              color: tWhite,
                              // color: tPrimaryColor
                            ),
                            child: Center(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    fontSize: isTab(context) ? 11.sp : 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: tPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Text(
                            "Please enter the verification code",
                            style: TextStyle(
                              fontSize: isTab(context) ? 7.sp : 10.sp,
                              fontWeight: FontWeight.w400,
                              color: tWhite,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.5.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      fontWeight: FontWeight.w600,
                      color: tPrimaryColor,
                    ),
                  ),
                ),

                // Button(
                //     borderSide: BorderSide(
                //       color: tPrimaryColor,
                //     ),
                //     color: tPrimaryColor,
                //     textcolor: tWhite,
                //     bottonText: 'Get OTP',
                //     onTap: (startLoading, stopLoading, btnState) {
                //       startLoading();
                //       if (_formKey.currentState!.validate()) {
                //         Twl.navigateTo(context, LocationScreen());
                //       }
                //       stopLoading();
                //     }),
                // SizedBox(height: tDefaultPadding),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Didn't receive the code? ",
                //       style:
                //           TextStyle(fontSize: isTab(context) ? 10.sp : 12.sp),
                //     ),
                //     SizedBox(width: (20)),
                //     //TimerButton Argon
                //     ArgonTimerButton(
                //         initialTimer: 30,
                //         height: (30),
                //         width: (100),
                //         borderRadius: 5.0,
                //         color: tPrimaryColor,
                //         child: Row(
                //           children: [
                //             Expanded(
                //               child: Text(
                //                 'RESEND OTP',
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: (12)),
                //               ),
                //             ),
                //           ],
                //         ),
                //         loader: (timeLeft) {
                //           return Text(
                //             "$timeLeft",
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w700),
                //           );
                //         },
                //         onTap: (
                //           startTimer,
                //           btnState,
                //         ) async {
                //           if (btnState == ButtonState.Idle) {
                //             startTimer(30);
                //           }

                //           //await verifyPhone(widget.phoneno);
                //         }),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
