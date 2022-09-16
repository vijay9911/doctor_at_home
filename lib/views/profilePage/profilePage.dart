// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/settings/settings.dart';
import 'package:sizer/sizer.dart';
import '../../constants/constants.dart';
import 'package:flutter/material.dart';

import '../../constants/imageConstant.dart';
import '../myDoctorPage/myDoctor.dart';
import '../recordsPage/recordsPage.dart';
import 'profileDetailsPage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  String title = 'Dipti Shandilya';

  Widget profileWidget(BuildContext context) {
    return Container(
      height: 180,
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: tPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: tWhite,
                      image: DecorationImage(
                        scale: 4,
                        image: AssetImage(Images.HEART),
                      ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: tWhite)),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: tWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: isTab(context) ? 11.sp : 14.sp,
                  ),
                ),
                Text(
                  'Blood Group B+',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: isTab(context) ? 9.sp : 10.sp,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () => Twl.navigateTo(
                  context,
                  ProfileDetailsPage(
                    title: title,
                  ),
                ),
                child: Image.asset(
                  Images.EDIT,
                  scale: 3.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
              color: tBlack,
              fontWeight: FontWeight.w500,
              fontSize: isTab(context) ? 11.sp : 12.sp,
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
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.settings_outlined,
              color: tPrimaryColor,
            ),
            SizedBox(width: 20),
            Text(
              'Settings',
              style: TextStyle(
                color: tBlack,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tWhite,
        foregroundColor: tPrimaryColor,
        elevation: 1.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600,
          fontSize: isTab(context) ? 11.sp : 14.sp,
          color: tBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileWidget(context),
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
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: tDividerColor,
                thickness: 1,
                height: 2,
              ),
            ),
            SizedBox(height: 15),
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

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool _isLoading = true;
//   void displayDialog(context, title, text) => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(title),
//           content: Text(text),
//           actions: [
//             new FlatButton(
//               child: new Text("Continue"),
//               onPressed: () {
//                 // Get.to(MainPage());
//               },
//             ),
//           ],
//         ),
//       );
//   String? email = ' ';
//   String? username = '  ';
//   String? lastName = '  ';
//   String? fullName = '  ';
//   String? profileImage = '  ';
//   String? firstName = '  ';

//   late String authCode;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   void validateAndSave() {
//     final FormState? form = _formKey.currentState;
//     if (form!.validate()) {
//       print('Form is valid');
//     } else {
//       print('Form is invalid');
//     }
//   }

//   final TextEditingController _emailIdController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   final TextEditingController _firstNameController = TextEditingController();

//   final TextEditingController _lastNameController = TextEditingController();
//   void initState() {
//     super.initState();
//   }

//   void dispose() {
//     // Clean up the controller when the widget is disposed.

//     _emailIdController.dispose();
//     _phoneController.dispose();

//     _firstNameController.dispose();

//     _lastNameController.dispose();

//     super.dispose();
//   }

//   bool kycLoading = true;

//   String? validateEmail(String? value) {
//     String pattern =
//         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//         r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
//         r"{0,253}[a-zA-Z0-9])?)*$";
//     RegExp regex = new RegExp(pattern);
//     if (!regex.hasMatch(value!))
//       return 'Enter a valid email address';
//     else
//       return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: tPrimaryColor,
//         centerTitle: true,
//         title: Text("Profile"),
//         // actions: [
//         //   Padding(
//         //       padding: EdgeInsets.all(15),
//         //       child: Image.asset("assets/icons/appbar_notification.png"))
//         // ],
//         leading: IconButton(
//             onPressed: () {
//               Twl.navigateBack(context);
//             },
//             icon: Icon(Icons.arrow_back_ios)),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: tDefaultPadding,
//               ),
//               Container(
//                 width: 75.w,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Photo",
//                       style: TextStyle(
//                           fontSize: 10.sp, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: isTab(context) ? 17.w : 6.w,
//                     ),
//                     Column(
//                       children: [
//                         profileImage != null
//                             ? Container(
//                                 width: 150,
//                                 height: 150.0,
//                                 decoration: new BoxDecoration(
//                                   color: tlightGray,
//                                   image: new DecorationImage(
//                                     image:
//                                         NetworkImage(profileImage.toString()),
//                                     fit: BoxFit.cover,
//                                   ),
//                                   borderRadius: new BorderRadius.all(
//                                       new Radius.circular(100.0)),
//                                 ),
//                               )
//                             : Center(
//                                 child: CircularProgressIndicator(
//                                   color: tPrimaryColor,
//                                 ),
//                               ),
//                         SizedBox(
//                           height: tDefaultPadding,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             showBarModalBottomSheet(
//                                 expand: false,
//                                 context: context,
//                                 backgroundColor: Colors.transparent,
//                                 builder: (context) => Container(
//                                     height:isMobile(context)? 150:30.w,
//                                     child: Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 60, top: 30, right: 60),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   Twl.getImage('gallery');
//                                                   // getImage('camera');
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Column(
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/images/Camera.png",
//                                                       scale: isTab(context)
//                                                           ? 3
//                                                           : 5,
//                                                     ),
//                                                     SizedBox(height: tDefaultPadding,),
//                                                     Text("Camera")
//                                                   ],
//                                                 ),
//                                               ),
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   Twl.getImage('camera');
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Column(
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/images/imageUpload.png",
//                                                       scale: isTab(context)
//                                                           ? 3
//                                                           : 5,
//                                                     ),
//                                                     SizedBox(height: tDefaultPadding,),
//                                                     Text("Gallery")
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     )));
//                           },
//                           child: Text(
//                             "Upload Image",
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: tDefaultPadding,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 15, right: 15),
//                 child: Column(
//                   children: [
//                     CustomTextFormField(
//                         validators: (value) {},
//                         hinttext: 'First Name',
//                         controllers: _phoneController),
//                     SizedBox(
//                       height: tDefaultPadding,
//                     ),
//                     CustomTextFormField(
//                         validators: (value) {},
//                         hinttext: 'Last Name',
//                         controllers: _lastNameController),
//                     SizedBox(
//                       height: tDefaultPadding,
//                     ),
//                     CustomTextFormField(
//                         validators: (value) {},
//                         hinttext: 'Phone number',
//                         controllers: _phoneController),
//                     SizedBox(
//                       height: tDefaultPadding,
//                     ),
//                     CustomTextFormField(
//                         validators: (value) {
//                           String? pattern =
//                               r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                           RegExp regex = new RegExp(pattern);
//                           if (!(regex.hasMatch(value!))) return "Invalid Email";
//                         },
//                         hinttext: 'Enter Your Email ID',
//                         controllers: _emailIdController),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: tDefaultPadding,
//               ),
//               _isLoading
//                   ? Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: tDefaultPadding / 1.4 ),
//                       child: Button(
//                           borderSide: BorderSide(
//                             color: tPrimaryColor,
//                           ),
//                           color: tPrimaryColor,
//                           textcolor: tWhite,
//                           bottonText: 'Get OTP',
//                           onTap: (startLoading, stopLoading, btnState) {}),
//                     )
//                   : Center(
//                       child: CircularProgressIndicator(),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
