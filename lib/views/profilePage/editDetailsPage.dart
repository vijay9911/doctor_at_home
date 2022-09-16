import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/models/profileModel.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:numberpicker/numberpicker.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  int index = 0;

  List<String> appBarTitles = [
    'Edit Name',
    'Edit Mobile Number',
    'Edit Email',
    'Select Gender',
    'Date Of Birth',
    'Blood Group',
    'BMI',
    'Height',
    'Weight',
    'Emergency Contact',
    'Location'
  ];

  List<String> pageTitles = [
    'What is your name ?',
    'What is your mobile number ?',
    'What is your email id ?',
    'Select your gender',
    'When is your Birthday ?',
    'What is your Blood group ?',
    'What is your BMI ?',
    'What is your height ?',
    'How much do you Weight ? (Kgs)',
    'who is your Emergency Contact ?',
    'Which city are you from ?',
  ];

  late String appBarTitle = 'title';
  String pageTitle = 'title';
  Widget childWidget = Container();

  Widget textFieldWidget(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: TextFormField(
        keyboardType: appBarTitle == 'Edit Mobile Number' ? TextInputType.phone : null,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: tBlack,
          ),
        ),
      ),
    );
  }

  Widget pageTitleWidget() {
    return Container(
      height: 90,
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 15, right: 10, bottom: 15),
      decoration: BoxDecoration(
        color: tPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35,
          left: 30,
        ),
        child: Text(
          pageTitle,
          style: TextStyle(
            color: tWhite,
            fontSize: isTab(context) ? 12.sp : 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  int genderSelectedIndex = 0;
  int bloodGroupSelectedIndex = 0;

  Widget genderButtonWidget(IconData icons, String iconTitle, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          genderSelectedIndex = index;
        });
      },
      child: Container(
        width:26.w,
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: tPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(7),
          color: genderSelectedIndex == index ? tPrimaryColor : tWhite,
        ),
        child: Row( 
          children: [
            Icon(
              icons,
              size: 20,
              color: genderSelectedIndex == index ? tWhite : tPrimaryColor,
            ),
            SizedBox(width: 2.w),
            Text(
              iconTitle,
              style: TextStyle(
                color: genderSelectedIndex == index ? tWhite : tPrimaryColor,
                fontSize: isTab(context) ? 8.sp : 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderWidget() {
    return Container(
      margin: EdgeInsets.only(top: 19.h),
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              genderButtonWidget(Icons.male_outlined, 'Male', 0),
              genderButtonWidget(Icons.female_outlined, 'Female', 1),
            ],
          ),
          SizedBox(height: 30),
          genderButtonWidget(Icons.transgender_outlined, 'Others', 2),
        ],
      ),
    );
  }

  Widget bloodGroupButtonWidget(String bloodGTitle, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          setState(() {
            bloodGroupSelectedIndex = index;
          });
        },
        child: Container(       
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: tPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(7),
            color: bloodGroupSelectedIndex == index ? tPrimaryColor : tWhite,
          ),
          child: Text(
            bloodGTitle,
            style: TextStyle(
              color: bloodGroupSelectedIndex == index ? tWhite : tPrimaryColor,
              fontSize: isTab(context) ? 9.sp : 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget bloodGroupWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bloodGroupButtonWidget('A+', 0),
              bloodGroupButtonWidget('A-', 1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bloodGroupButtonWidget('B+', 2),
              bloodGroupButtonWidget('B-', 3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bloodGroupButtonWidget('O+', 4),
              bloodGroupButtonWidget('O-', 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bloodGroupButtonWidget('B+', 6),
              bloodGroupButtonWidget('B-', 7),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectDateWidget() {
    return Container(
      height: 210,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 100),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [tCardBoxShadow],
            borderRadius: BorderRadius.circular(10),
            color: tWhite,
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text(
                  selectedDate.day.toString() +
                      ' ' +
                      selectedDate.month.toString() +
                      ' ' +
                      selectedDate.year.toString(),
                      style: TextStyle( fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 7.sp : 10.sp,color: tPrimaryColor),
                ),
              ),
              DatePickerWidget(
                firstDate: DateTime.now(),
                dateFormat: "dd/MMMM/yyyy",
                onChange: (DateTime newDate, _) {
                  setState(() {
                    selectedDate = newDate;
                    print(selectedDate);
                  });
                },
                pickerTheme: DateTimePickerTheme(
                  itemHeight: 50,
                  dividerColor: tPrimaryColor,
                  itemTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab(context) ? 12.sp : 16.sp),
                  pickerHeight: 160,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int bmiValue = 0;
  int bmifractionValue = 0;

  Widget bmiWidget() {
    return Container(
      height: 37.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 12.h, left: 10,right: 10),
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.only(bottom: 19,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   bmiValue.toString() + '.' + bmifractionValue.toString(),
              // ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: Divider(
                                thickness: 3,
                                color: tPrimaryColor,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Divider(
                                height: 100,
                                thickness: 3,
                                color: tPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      NumberPicker(
                        key: UniqueKey(),
                        maxValue: 100,
                        minValue: 0,
                        value: bmiValue,
                        onChanged: (int value) {
                          setState(() {
                            bmiValue = value;
                          });
                        },
                        haptics: true,
                        selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: tBlack,
                            fontSize: isTab(context) ? 10.sp : 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: Divider(
                                thickness: 3,
                                color: tPrimaryColor,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Divider(
                                height: 100,
                                thickness: 3,
                                color: tPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      NumberPicker(
                        key: UniqueKey(),
                        maxValue: 100,
                        minValue: 0,
                        value: bmifractionValue,
                        onChanged: (int value) {
                          setState(() {
                            bmifractionValue = value;
                          });
                        },
                        selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: tBlack,
                            fontSize: isTab(context) ? 10.sp : 14.sp),
                        haptics: true,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  int heightValue = 0;
  int heightFractionValue = 0;

  Widget heightWidget() {
    return Container(
      height: 38.h,
      padding: EdgeInsets.only(top: 20),
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.only(top: 13.h, left: 10, right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Text(
            //   heightValue.toString() + '.' + heightFractionValue.toString(),
            // ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 15),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            child: Divider(
                              thickness: 2,
                              color: tPrimaryColor,
                            ),
                          ),
                          Container(
                            width: 70,
                            child: Divider(
                              height: 90,
                              thickness: 2,
                              color: tPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    NumberPicker(
                      key: UniqueKey(),
                      maxValue: 10,
                      minValue: 0,
                      value: heightValue,
                      onChanged: (int value) {
                        setState(() {
                          heightValue = value;
                        });
                      },
                      haptics: true,
                      selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: tBlack,
                          fontSize: isTab(context) ? 10.sp : 14.sp),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    'Feet',
                    style: TextStyle(
                        color: tGray,
                        fontSize: isTab(context) ? 9.sp : 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left:15),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            child: Divider(
                              thickness: 2,
                              color: tPrimaryColor,
                            ),
                          ),
                          Container(
                            width: 70,
                            child: Divider(
                              height: 90,
                              thickness: 2,
                              color: tPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    NumberPicker(
                      key: UniqueKey(),
                      maxValue: 11,
                      minValue: 0,
                      value: heightFractionValue,
                      onChanged: (int value) {
                        setState(() {
                          heightFractionValue = value;
                        });
                      },
                      selectedTextStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: tBlack,
                        fontSize: isTab(context) ? 10.sp : 14.sp,
                      ),
                      haptics: true,
                    ),
                  ],
                ),
                Text(
                  'Inches',
                  style: TextStyle(
                      color: tGray,
                      fontSize: isTab(context) ? 9.sp : 12.sp,
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  int weightValue = 0;

  Widget weightWdget() {
    return Container(
      height: 38.h,
      child: Card(
        margin: EdgeInsets.only(top: 12.h, left: 10, right: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // Text(weightValue.toString()),
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, left: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                child: Divider(
                                  thickness: 3,
                                  color: tPrimaryColor,
                                ),
                              ),
                              Container(
                                width: 80,
                                child: Divider(
                                  height: 100,
                                  thickness: 3,
                                  color: tPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        NumberPicker(
                          key: UniqueKey(),
                          maxValue: 200,
                          minValue: 0,
                          value: weightValue,
                          onChanged: (int value) {
                            setState(() {
                              weightValue = value;
                            });
                          },
                          haptics: true,
                          selectedTextStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: tBlack,
                              fontSize: isTab(context) ? 10.sp : 14.sp),
                        ),
                      ],
                    ),
                    Text(
                      'kgs',
                      style: TextStyle(
                        color: tGray,
                        fontSize: isTab(context) ? 9.sp : 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget locationWidget() {
    return Card(
      margin: EdgeInsets.only(
        top: 16.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Use My Current Location',
                  style: TextStyle(
                    fontSize: isTab(context) ? 12.sp : 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tPrimaryColor,
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              height: 2,
              color: tGray,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pick a City',
                  style: TextStyle(
                    fontSize: isTab(context) ? 12.sp : 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tPrimaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget emergencyContactWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textFieldWidget('Full Name'),
          SizedBox(
            height: 30,
          ),
          textFieldWidget('Mobile Number'),
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('dd/MMMM/yyyy');

  @override
  Widget build(BuildContext context) {
    List<ProfileModel> items =
        DUMMY_PROFILE.where((item) => item.id == widget.id).toList();
    final item = items[index];
    print(item.id);
    if (item.id == '1') {
      setState(() {
        appBarTitle = appBarTitles[0];
        pageTitle = pageTitles[0];
        childWidget = textFieldWidget('Name');
      });
    } else if (item.id == '2') {
      setState(() {
        appBarTitle = appBarTitles[1];
        pageTitle = pageTitles[1];
        childWidget = textFieldWidget('Number');
      });
    } else if (item.id == '3') {
      setState(() {
        appBarTitle = appBarTitles[2];
        pageTitle = pageTitles[2];
        childWidget = textFieldWidget('Email');
      });
    } else if (item.id == '4') {
      setState(() {
        appBarTitle = appBarTitles[3];
        pageTitle = pageTitles[3];
        childWidget = genderWidget();
      });
    } else if (item.id == '5') {
      setState(() {
        appBarTitle = appBarTitles[4];
        pageTitle = pageTitles[4];
        childWidget = selectDateWidget();
      });
    } else if (item.id == '6') {
      setState(() {
        appBarTitle = appBarTitles[5];
        pageTitle = pageTitles[5];
        childWidget = bloodGroupWidget();
      });
    } else if (item.id == '7') {
      setState(() {
        appBarTitle = appBarTitles[6];
        pageTitle = pageTitles[6];
        childWidget = bmiWidget();
      });
    } else if (item.id == '8') {
      setState(() {
        appBarTitle = appBarTitles[7];
        pageTitle = pageTitles[7];
        childWidget = heightWidget();
      });
    } else if (item.id == '9') {
      setState(() {
        appBarTitle = appBarTitles[8];
        pageTitle = pageTitles[8];
        childWidget = weightWdget();
      });
    } else if (item.id == '10') {
      setState(() {
        appBarTitle = appBarTitles[9];
        pageTitle = pageTitles[9];
        childWidget = emergencyContactWidget();
      });
    } else if (item.id == '11') {
      setState(() {
        appBarTitle = appBarTitles[10];
        pageTitle = pageTitles[10];
        childWidget = locationWidget();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        foregroundColor: tBlack,
        backgroundColor: tWhite,
        elevation: 1.0,
        leading: GestureDetector(onTap: () {
          Twl.navigateBack(context);
        },child: Image.asset(Images.NAVIGATEBACK,scale: 4,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                pageTitleWidget(),
                Container(
                  height: 80.h,
                  child: Stack(
                    children: [
                      childWidget,
                      Positioned(
                        top:65.h,
                        left: 250,
                        child: GestureDetector(
                          onTap: () => Twl.navigateBack(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            width: 120,
                            decoration: BoxDecoration(
                              color: tPrimaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.done,
                                  color: tWhite,
                                ),
                                Text(
                                  'Save',
                                  style: TextStyle(
                                    color: tWhite,
                                    fontSize: isTab(context) ? 7.sp : 10.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
