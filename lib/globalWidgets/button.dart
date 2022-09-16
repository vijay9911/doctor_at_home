import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../responsive.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key, this.color, this.bottonText, this.onTap, this.borderSide, this.textcolor,
  }) : super(key: key);
  final color;
  final String? bottonText;
  final onTap;
  final borderSide;
  final textcolor;

  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height:isTab(context)?70 :  50, 
      width: 100.w, 
      color: color,
      borderRadius:10,
      borderSide: borderSide,
      child: Text(bottonText!,style: TextStyle(color: textcolor,fontWeight: FontWeight.w600,fontSize: isTab(context)?10.sp : 14.sp),),
      loader: Container(
        padding: EdgeInsets.all(10),
        child: SpinKitRotatingCircle(
          color: Colors.white,
          // size: loaderWidth ,
        ),
      ),
      onTap:onTap,
    );
  }
}