import 'package:base_project_flutter/responsive.dart';

import 'package:base_project_flutter/views/appointment/myAppoinment.dart';
import 'package:base_project_flutter/views/homePage/homePage.dart';
import 'package:base_project_flutter/views/profilePage/profilePage.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/imageConstant.dart';
import '../servicesPage/servicesPage.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key, this.tabIndexId}) : super(key: key);

  final tabIndexId;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void checkBottomIndex() {
    setState(() {
      tabIndexs = widget.tabIndexId != null ? widget.tabIndexId : 0;
    });
  }

  var tabIndexs = 0;
  void _onItemTapped(int index) {
    setState(() {
      tabIndexs = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // DrawerList(),
          IndexedStack(
            index: tabIndexs,
            children: [
              HomePage(),
              ServicesPage(),
              AppointmentScreen(),
              ProfilePage(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: tGray,
        selectedItemColor: tPrimaryColor,
        onTap: _onItemTapped,
        currentIndex: tabIndexs,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: isTab(context) ? 40 : 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          _bottomNavigationBarItem(
            icon: Image.asset(
              Images.HOME,
              height: 30,
              color: tabIndexs == 0 ? tPrimaryColor : null,
            ),
            label: 'Home',
          ),
          _bottomNavigationBarItem(
            icon: Image.asset(
              Images.SERVICES,
              height: 30,
              color: tabIndexs == 1 ? tPrimaryColor : null,
            ),
            label: 'Services',
          ),
          _bottomNavigationBarItem(
            icon: Image.asset(
              Images.APPOINTMENTIMAGE,
              height: 30,
              color: tabIndexs == 2 ? tPrimaryColor : null,
            ),
            label: 'Appiontment',
          ),
          _bottomNavigationBarItem(
            icon: Image.asset(
              Images.PROFILEIMAGE,
              height: 30,
              color: tabIndexs == 3 ? tPrimaryColor : null,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  _bottomNavigationBarItem({required icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
