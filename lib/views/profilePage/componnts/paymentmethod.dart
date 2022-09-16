import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/views/profilePage/componnts/paymentsuccessful.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/imageConstant.dart';
import '../../../responsive.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({ Key? key }) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
int selectedValue = 0;
   Widget billAmount() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: tSecondaryGradient ,
          boxShadow: [tCardBoxShadow]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Amount to pay",
              style: TextStyle(
                  fontSize: isTab(context) ? 9.sp : 12.sp,
                  fontWeight: FontWeight.w600,
                  color: tWhite),
            ),
            Row(
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => tPrimaryGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    currencySymbol,
                    style: TextStyle(
                      fontSize: isTab(context) ? 15.sp : 18.sp,
                      fontWeight: FontWeight.w600,
                      color: tWhite,
                    ),
                  ),
                ),
                Text(
                  "850",
                  style: TextStyle(
                    fontSize: isTab(context) ?15.sp : 18.sp,
                    fontWeight: FontWeight.w600,
                    color: tWhite,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget paymentTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: isTab(context) ? 9.sp : 12.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  Widget recentlyUsedWidget() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: tWhite,
          borderRadius: BorderRadius.circular(10),
        
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<int>(
              value: 0,
              groupValue: selectedValue,
              // activeColor: tThridColor,
              onChanged: (value) => setState(() => selectedValue = 0),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: tWhite,
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 0.1,
                  //   )
                  // ],
                  border: Border.all(
                  color: tPaymentCardColor,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset(
                Images.GOOGLEPAY,
                scale: 3,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Google pay',
              style: TextStyle(
                fontSize: isTab(context) ? 7.sp : 10.sp,
                fontWeight: FontWeight.w500,
                color: tBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget creditAndDebitCardWidget() {
    return Card(
      
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: tWhite,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [tCardBoxShadow]
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: tWhite,
                
                border: Border.all(
                 color: tPaymentCardColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                Images.DIVIDE,
                // color: tThridColor,
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Card',
                  style: TextStyle(
                    fontSize: isTab(context) ? 7.sp : 10.sp,
                    fontWeight: FontWeight.w600,
                    color: tBlack,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Avoid ringing bell',
                  style: TextStyle(
                    fontSize: isTab(context) ? 7.sp : 10.sp,
                    fontWeight: FontWeight.w400,
                    color: tGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 Widget upiWidget() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: tWhite,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [tCardBoxShadow]
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio<int>(
                    value: 1,
                    groupValue: selectedValue,
                    // activeColor: tThridColor,
                    onChanged: (value) => setState(() => selectedValue = 1),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: tWhite,
                        
                        border: Border.all(
                        color: tPaymentCardColor,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      Images.PHONEPAY,
                      scale: 3,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Phone Pay',
                    style: TextStyle(
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      fontWeight: FontWeight.w600,
                      color: tBlack,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: tlightGray,
              height: 3,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: tWhite,
                      
                      border: Border.all(
                      color: tPaymentCardColor,
                       
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      Images.DIVIDE,
                      // color: tThridColor,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New UPI ID',
                        style: TextStyle(
                          fontSize: isTab(context) ?7.sp : 10.sp,
                          fontWeight: FontWeight.w600,
                          color: tBlack,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'you need to have register UPI ID',
                        style: TextStyle(
                            fontSize: isTab(context) ? 8.sp : 9.sp,
                            fontWeight: FontWeight.w400,
                            color: tGray,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
    Widget morePaymentOptionsWidget() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: tWhite,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [tCardBoxShadow]
        ),
        child: Column(
          children: [
            subPaymentOptionsWidget(
              Images.WALLET,
              'Wallet',
              'Paytem, PhonePe, Amazon Pay & More',
              2,
            ),
            subPaymentOptionsWidget(
              Images.NETBANKING,
              'Netbanking',
              'Select from a list of bamks',
              3,
            ),
            subPaymentOptionsWidget(
              Images.PAYON,
              'Pay On Delivery',
              'Pay with cash',
              4,
            )
          ],
        ),
      ),
    );
  }
  Widget subPaymentOptionsWidget(
    String imagepath,
    String title,
    String subTitle,
    int index,
  )
   {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio<int>(
            value: index,
            groupValue: selectedValue,
            // activeColor: tThridColor,
            onChanged: (value) => setState(() => selectedValue = index),
          ),
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: tWhite,
                
                border: Border.all(
                  color: tPaymentCardColor,
                
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Image.asset(
              imagepath,
              height: 25,
              width: 25,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTab(context) ? 7.sp : 10.sp,
                    fontWeight: FontWeight.w600,
                    color: tBlack,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: isTab(context) ? 6.sp : 9.sp,
                    fontWeight: FontWeight.w400,
                    color: tGray,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
Widget selectPaymentOptionWidget() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: tPaymentColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [tCardBoxShadow]
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        // color: tselectPaymentOptionBgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: tWhite,
                     
                      border: Border.all(
                        color: tPaymentCardColor,
                  
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      Images.GOOGLEPAY,
                      scale: 3,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Google pay',
                    style: TextStyle(
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      fontWeight: FontWeight.w500,
                      color: tBlack,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: tPrimaryColor,
                  ),
                ],
              ),
            ),
            Text(
              currencySymbol + '180',
              style: TextStyle(
                color: tPrimaryColor,
                fontSize: isTab(context)? 11.sp : 14.sp,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: tWhite,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: tWhite,
        // centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(
            color: tBlack,
              fontSize: isTab(context) ? 9.sp : 12.sp,
              fontWeight: FontWeight.w700),
        ),
        leading: GestureDetector(
          onTap: () {
            Twl.navigateBack(context);
          },
          child: Image.asset(
            Images.NAVIGATEBACK,
            scale: 3,
          ),
        ),
      ),
       body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    billAmount(),
                    SizedBox(
                      height: 10,
                    ),
                    paymentTitle('Recently Used'),
                    SizedBox(
                      height: 10,
                    ),
                    recentlyUsedWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    paymentTitle('Credit & Debit Card'),
                    SizedBox(
                      height: 10,
                    ),
                    creditAndDebitCardWidget(),
                    SizedBox(height: 10),
                    paymentTitle('UPI'),
                    SizedBox(height: 10),
                    upiWidget(),
                    SizedBox(height: 10),
                    paymentTitle('More Payment Options'),
                    SizedBox(height: 10),
                    morePaymentOptionsWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: selectPaymentOptionWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: (){
                    Twl.navigateTo(context, PaymentSuccessful());
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
                        "Pay",
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w700,
                            color: tWhite),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
        // SafeArea(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         billAmount(),
        //       ],
        //     ),
        //   ),
        // ),
      
    );

  }
}