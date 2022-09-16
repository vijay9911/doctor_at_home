import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bookAppointment/bookAppointment.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              child: Card(
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Image.asset(
                          Images.SUCCESSFUL,
                          scale: 2.7,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        currencySymbol + "850",
                        style: TextStyle(
                            fontSize: isTab(context) ? 19.sp : 22.sp,
                            fontWeight: FontWeight.w700,
                            color: tBlack),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Payment Done',
                        style: TextStyle(
                            fontSize: isTab(context) ? 16.sp : 19.sp,
                            fontWeight: FontWeight.w700,
                            color: tBlue),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Your payment is successfully completed',
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  Twl.navigateTo(
                      context,
                      BookAppointmentScreen(
                        index: 0,
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: tBlue,
                    borderRadius: BorderRadius.circular(30),
                    // gradient: tPrimaryGradient,
                    // boxShadow: [tCardBoxShaow],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontSize: isTab(context) ? 11.sp : 14.sp,
                          fontWeight: FontWeight.w700,
                          color: tWhite),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
