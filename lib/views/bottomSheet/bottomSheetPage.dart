import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/imageConstant.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  Widget titleWidget() {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Twl.navigateBack(context),
            child: Image.asset(
              Images.CANCEL,
              scale: 4,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Sort & Filters',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: isTab(context) ? 11.sp : 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  int _selectedalue = 0;

  String subTitle1 =
      'Doctors at Clinic/Hospitals which assure on-time appointments ans great in-clinic expierience';
  String subTitle2 = 'Find the doctors, most recommended by verified patients';

  Widget sortByWidgets(String title, String subTitle, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: isTab(context) ? 9.sp : 12.sp,
                ),
              ),
              SizedBox(height: 10),
              Text(
                subTitle,
                maxLines: 4,
                style: TextStyle(
                  color: tGray,
                  fontWeight: FontWeight.w400,
                  fontSize: isTab(context) ? 8.sp : 10.sp,
                ),
              ),
            ],
          ),
        ),
        Radio<int>(
          value: index,
          groupValue: _selectedalue,
          onChanged: (value) {
            setState(() {
              _selectedalue = value!;
            });
          },
        ),
      ],
    );
  }

  Widget filterByWidget(String title, int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: isTab(context) ? 9.sp : 12.sp,
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: _selectedalue,
            onChanged: (value) {
              setState(() {
                _selectedalue = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  bool isSwitched = false;

  Widget videoConsultWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Video Consult',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: isTab(context) ? 9.sp : 12.sp,
          ),
        ),
        Switch(
          value: isSwitched,
          onChanged: (bool value) {
            setState(
              () {
                isSwitched = value;
              },
            );
          },
        )
      ],
    );
  }

  bool isMaleChecked = false;
  bool isfemaleChecked = false;

  Widget checkBoxWidget(String text, bool isValue) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isTab(context) ? 9.sp : 12.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget genderWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            checkBoxWidget('Male', isMaleChecked),
            Checkbox(
              value: isMaleChecked,
              onChanged: (value) {
                setState(() {
                  isMaleChecked = value!;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            checkBoxWidget('Female', isfemaleChecked),
            Checkbox(
              value: isfemaleChecked,
              onChanged: (value) {
                setState(() {
                  isfemaleChecked = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  double amount = 5000;

  Widget consultationFeeWidget() {
    return Slider(
      value: amount,
      min: 0,
      max: 5000,
      divisions: 500,
      activeColor: tPrimaryColor,
      onChanged: (value) {
        setState(() {
          amount = value;
        });
      },
    );
  }

  RangeValues _currentRangeValues = const RangeValues(0, 75);

  Widget yearOfExperienceWidget() {
    return RangeSlider(
      values: _currentRangeValues,
      min: 0,
      max: 75,
      divisions: 25,
      activeColor: tPrimaryColor,
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }

  bool isClinic = false;
  bool isHospital = false;

  Widget meetTheDoctorWidget() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBoxWidget('Clinic', isClinic),
              Checkbox(
                value: isClinic,
                onChanged: (value) {
                  setState(() {
                    isClinic = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBoxWidget('False', isHospital),
              Checkbox(
                value: isHospital,
                onChanged: (value) {
                  setState(() {
                    isHospital = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget(),
            Divider(
              color: tGray,
              height: 10,
            ),
            SizedBox(height: 15),
            Text(
              'Sort By',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 14.sp,
              ),
            ),
            sortByWidgets('Consultation Benfits', subTitle1, 0),
            sortByWidgets('Patient Recommendations', subTitle1, 1),
            sortByWidgets('Earliest Available', '', 2),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 15),
            Text(
              'Filter By',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 14.sp,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Now or Later",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 9.sp : 12.sp,
              ),
            ),
            filterByWidget('AnyTime', 0),
            filterByWidget('Next 2 Hours', 1),
            filterByWidget('Today', 2),
            filterByWidget('Tomorrow', 3),
            filterByWidget('Saturday, 03 June', 4),
            filterByWidget('Sunday, 04 June', 5),
            filterByWidget('Monday, 05 June', 6),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 5),
            videoConsultWidget(),
            SizedBox(height: 5),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 15),
            Text(
              'Gender',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 12.sp,
              ),
            ),
            SizedBox(height: 5),
            genderWidget(),
            SizedBox(height: 5),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 15),
            Text(
              'Years of Experience',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 12.sp,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _currentRangeValues.start.round().toString() +
                  ' Years - ' +
                  _currentRangeValues.end.round().toString() +
                  ' Years',
              style: TextStyle(
                fontSize: isTab(context) ? 9.sp : 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            yearOfExperienceWidget(),
            SizedBox(height: 15),
            Divider(
              height: 20,
              color: tGray,
            ),
               SizedBox(height: 15),
            Text(
              'Consultation Fee',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 12.sp,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Below ' + currencySymbol + amount.toInt().toString(),
              style: TextStyle(
                  fontSize: isTab(context) ? 11.sp : 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            consultationFeeWidget(),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 15),
            Text(
              'Meet the doctor at',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTab(context) ? 11.sp : 12.sp,
              ),
            ),
            SizedBox(height: 5),
            meetTheDoctorWidget(),
            Divider(
              height: 20,
              color: tGray,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear All',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: tBlack,
                      fontSize: isTab(context) ? 11.sp : 14.sp,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Twl.navigateBack(context);
                  },
                  style: ElevatedButton.styleFrom(primary: tPrimaryColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: isTab(context) ? 12.sp : 14.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
