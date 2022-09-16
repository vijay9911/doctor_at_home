import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/settings/settings.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../constants/imageConstant.dart';
import '../myDoctorPage/myDoctor.dart';
import '../profilePage/profileDetailsPage.dart';
import '../recordsPage/recordsPage.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  Widget optionsWidget(BuildContext context, String title, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: tWhite,
              fontWeight: FontWeight.w500,
              fontSize: isTab(context) ? 9.sp : 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Twl.navigateTo(context, SettingPage());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Row(
          children: [
            Icon(
              Icons.settings_outlined,
              color: tWhite,
            ),
            SizedBox(width: 20),
            Text(
              'Settings',
              style: TextStyle(
                color: tWhite,
                fontWeight: FontWeight.w500,
                fontSize: isTab(context) ? 9.sp : 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      backgroundColor: tPrimaryColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Twl.navigateBack(context),
              child: Image.asset(
                Images.CANCEL,
                height: 40,
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, right: 10, bottom: 20),
              decoration: BoxDecoration(
                color: tWhite,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Twl.navigateTo(
                              context,
                              ProfileDetailsPage(
                                title: 'Dipti Snahdilya',
                              )),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: tWhite,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage(Images.HEART), scale: 2.5),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 70,
                          child: Image.asset(
                            Images.EDIT,
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Dipti Shnadilya',
                      style: TextStyle(
                        fontSize: isTab(context) ? 11.sp : 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Blood Group B+',
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontSize: isTab(context) ? 9.sp : 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Twl.navigateTo(context, MyDoctorScreen(index: 0,)),
              child: optionsWidget(context, 'My Doctors', Images.MYDOCTORS),
            ),
            GestureDetector(
              onTap: () => Twl.navigateTo(context, MyDoctorScreen(index: 1,)),
              child: optionsWidget(context, 'Hospitals', Images.HOSPITALS),
            ),
            GestureDetector(
              onTap: () => Twl.navigateTo(context, RecordScreen()),
              child: optionsWidget(context, 'Records', Images.RECORDS),
            ),
            Divider(
              height: 4,
              color: tWhite,
              thickness: 2,
            ),
            GestureDetector(
              onTap: () => Twl.navigateTo(context, SettingPage()),
              child: settingsWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}


// class DarwerPage extends StatelessWidget {
//   const DarwerPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: isTab(context)? 50.w:70.w,
//       child: Drawer(
//           child: SafeArea(
//         child: ListView(padding: EdgeInsets.zero, children: <Widget>[
//           Container(
//             color: tWhite,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.arrow_back_ios),
//                 ),
//                 SizedBox(height: 10),
//                 UserDetail(
//                   name: 'Enter Your Email',
//                   contactNumber: '9999999999',
//                   // mail: 'contactnehacs@gmail.com',
//                   updateEdit: () {
//                     Twl.navigateTo(context, ProfilePage());
//                   },
//                   decoration: new BoxDecoration(
//                     color: const Color(0xFFF3F6FA),
//                     image: new DecorationImage(
//                       image: new NetworkImage(
//                           ' https://img.icons8.com/bubbles/50/000000/user.png'),
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius: new BorderRadius.all(
//                         new Radius.circular(isTab(context) ? 50 : 30.0)),
//                   ),
//                   // image: Image.network(
//                   //   profileImage != null ? profileImage : "",
//                   //   fit: BoxFit.cover,
//                   // ),
//                 ),
//                 SizedBox(height: 15),
//               ],
//             ),
//           ),
//           if (Platform.isIOS)
//             Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: ListTile(
//                   leading: Icon(
//                     Icons.home,
//                     size: isTab(context) ? 35 : 25,
//                   ),
//                   title: Text(
//                     'Home',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 10.sp),
//                   ),
//                   onTap: () {
//                     // Get.toNamed(AppRoutes.WALLETTRANSACTIONS);
//                   }),
//             ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading:
//                     Icon(Icons.translate_sharp, size: isTab(context) ? 35 : 25),
//                 title: Text(
//                   'My Transactions',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () {
//                   // Get.toNamed(AppRoutes.WALLETTRANSACTIONS);
//                 }),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading:
//                     Icon(Icons.local_offer, size: isTab(context) ? 35 : 25),
//                 title: Text(
//                   'Offers',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () {}),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading:
//                     Icon(Icons.notifications, size: isTab(context) ? 35 : 25),
//                 title: Text(
//                   'Notifications',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () {}),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading: Icon(Icons.share, size: isTab(context) ? 35 : 25),
//                 title: Text(
//                   'Referral',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () {}),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading: Icon(Icons.lock_outlined,
//                     color: tBlack, size: isTab(context) ? 35 : 25),
//                 // Image.asset(
//                 //   Images.Share,
//                 //   height: 20,
//                 //   width: 20,
//                 // ),
//                 title: Text(
//                   'Change Password',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () {}),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: ListTile(
//                 leading: Icon(Icons.logout, size: isTab(context) ? 35 : 25),
//                 title: Text(
//                   'Logout',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 10.sp),
//                 ),
//                 onTap: () async {}),
//           ),
//           SizedBox(height: tDefaultPadding),
//           Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {
//                   Twl.launchURL(ABOUTUS);
//                 },
//                 child: Text(
//                   'About Us',
//                   style: TextStyle(
//                       color: tGray,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp),
//                 ),
//               ),
//             ),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {
//                   Twl.launchURL(HELP_AND_FAQ);
//                   // Get.to(HelpFaqWebView());
//                 },
//                 child: Text(
//                   'Help & FAQS',
//                   style: TextStyle(
//                       color: tGray,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp),
//                 ),
//               ),
//             ),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {
//                   Twl.launchURL(PRIVACY);
                  
//                   // Get.toNamed(AppRoutes.TERMSCONDITION);
//                 },
//                 child: Text(
//                   'Privacy',
//                   style: TextStyle(
//                       color: tGray,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp),
//                 ),
//               ),
//             ),
//           ),
//           if (isTab(context))
//             SizedBox(
//               height: tDefaultPadding,
//             ),
//           Padding(
//             padding: EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {
//                   Twl.launchURL(TERMS_AND_CONDITIONS);
                  
//                   // Get.toNamed(AppRoutes.TERMSCONDITION);
//                 },
//                 child: Text(
//                   'Terms & Conditions',
//                   style: TextStyle(
//                       color: tGray,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       )),
//     );
//   }
// }

// class UserDetail extends StatelessWidget {
//   const UserDetail({
//     Key? key,
//     this.name,
//     this.contactNumber,
//     this.image,
//     this.decoration,
//     this.updateEdit,
//     // this.mail,
//   }) : super(key: key);

//   final String? name;
//   final String? contactNumber;
// //  final String?mail;
//   final Image? image;
//   final Decoration? decoration;
//   final updateEdit;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Container(
//                 width: isTab(context) ? 100 : 65.0,
//                 height: isTab(context) ? 100 : 65.0,
//                 decoration: decoration,
//               )),
//         ),
//         Expanded(
//           flex: 6,
//           child: Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(contactNumber!,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w600)),
//                 SizedBox(height: isTab(context) ? tDefaultPadding : 6),
//                 Row(
//                   children: [
//                     Text(
//                       name!,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10.sp),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 20),
//                       child: GestureDetector(
//                         onTap: updateEdit,
//                         child: Icon(
//                           Icons.edit,
//                           size: isTab(context) ? 35 : 25,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 6),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
