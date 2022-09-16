import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bottomNavigation.dart/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({Key? key}) : super(key: key);

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  int slecetedIndex = 0;
  String? selectedValue;
  String? bloodSelectedValue;
  String? heightSelectedValue;
  String? weightSelectedValue;

  List<DropdownMenuItem<String>> bloodgroup = [
    DropdownMenuItem(child: Text("A+"), value: "A+"),
    DropdownMenuItem(child: Text("A-"), value: "A-"),
    DropdownMenuItem(child: Text("B+"), value: "B+"),
    DropdownMenuItem(child: Text("B-"), value: "B-"),
    DropdownMenuItem(child: Text("O+"), value: "O+"),
    DropdownMenuItem(child: Text("O-"), value: "O-"),
    DropdownMenuItem(child: Text("AB+"), value: "AB+"),
    DropdownMenuItem(child: Text("AB-"), value: "AB-"),
  ];
  List<DropdownMenuItem<String>> height = [
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
    DropdownMenuItem(child: Text("5"), value: "5"),
    DropdownMenuItem(child: Text("6"), value: "6"),
    DropdownMenuItem(child: Text("7"), value: "7"),
    DropdownMenuItem(child: Text("8"), value: "8"),
  ];
  List<DropdownMenuItem<String>> weight = [
    DropdownMenuItem(child: Text("0-5"), value: "0-5"),
    DropdownMenuItem(child: Text("6-10"), value: "6-10"),
    DropdownMenuItem(child: Text("11-15"), value: "11-15"),
    DropdownMenuItem(child: Text("16-20"), value: "16-20"),
    DropdownMenuItem(child: Text("21-25"), value: "21-25"),
    DropdownMenuItem(child: Text("26-30"), value: "26-30"),
    DropdownMenuItem(child: Text("31-35"), value: "31-35"),
    DropdownMenuItem(child: Text("36-40"), value: "36-40"),
  ];

  Widget genderWidget(String tittle, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          slecetedIndex = index;
        });
      },
      child: Expanded(
        flex: 3,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
              gradient: slecetedIndex == index ? tSecondaryGradient : null,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: tBorderColor)),
          //  margin: EdgeInsets.only(left: 15),
          child: Text(
            tittle,
            style: TextStyle(color: slecetedIndex == index ? tWhite : tBlack),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhite,
      appBar: AppBar(
        backgroundColor: tWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Twl.navigateBack(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: tPrimaryColor,
          ),
        ),
        title: Text(
          "Add Details",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: isTab(context) ? 7.sp : 10.sp,
              color: tPrimaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Enter your Full name",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ?  7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: tBorderColor),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [tSecondaryBoxShadow],
                    color: tWhite,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Date of Birth",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ?  7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: tBorderColor),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [tSecondaryBoxShadow],
                    color: tWhite,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ?  7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: tBorderColor),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [tSecondaryBoxShadow],
                    color: tWhite,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Mail Id",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: tBorderColor),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [tSecondaryBoxShadow],
                    color: tWhite,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    ),
                  ),
                ),
               SizedBox(
                  height: 20,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 5.5.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        genderWidget("Female", 0),
                        genderWidget(" Male ", 1),
                        genderWidget("Other ", 2),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Blood Group",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 7.sp : 10.sp,
                      color: tGray),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 5.5.h,
                  child: DropdownButtonFormField(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(Images.DROPDOWNICON,height: 8),
                    ),
                    
                    focusColor: tWhite,
                    decoration: InputDecoration(
                      hintText: "Select Blood Group",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isTab(context) ? 7.sp : 10.sp,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tBorderColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: tBorderColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedValue,
                    items: bloodgroup,
                    onChanged: (String? newValue) {
                      setState(() {
                        bloodSelectedValue = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: isTab(context) ?  7.sp : 10.sp,
                          color: tGray),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      "Weight",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: isTab(context) ?  7.sp : 10.sp,
                          color: tGray),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 5.5.h,
                        child: DropdownButtonFormField(
                          icon: Image.asset(Images.DROPDOWNICON,height: 8),
                          focusColor: tWhite,
                          decoration: InputDecoration(
                            hintText: "Height",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ?  7.sp : 10.sp,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: tBorderColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: tBorderColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: selectedValue,
                          items: height,
                          onChanged: (String? newValue) {
                            setState(() {
                              heightSelectedValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 5.5.h,
                        child: DropdownButtonFormField(
                          icon: Image.asset(Images.DROPDOWNICON,height: 8),
                          focusColor: tWhite,
                          decoration: InputDecoration(
                            hintText: "Weight",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isTab(context) ? 7.sp : 10.sp,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: tBorderColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: tBorderColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: selectedValue,
                          items: weight,
                          onChanged: (String? newValue) {
                            setState(() {
                              weightSelectedValue = newValue!;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Twl.navigateTo(context, BottomNavigation());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [tCardBoxShadow],
                      gradient: tSecondaryGradient,
                      // color: tPrimaryColor
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tWhite),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Twl.navigateTo(context, BottomNavigation());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: isTab(context) ? 9.sp : 12.sp,
                            fontWeight: FontWeight.w700,
                            color: tPrimaryColor),
                      ),
                      Image.asset(
                        Images.EXPANDLEFT,
                        scale: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
