// ignore_for_file: unnecessary_statements, deprecated_member_use

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Twl {
  bool isLoading = true;

  late String username;
  late String sessionId;
  late String deviceToken;
  late String authCode;

  void verifyOtpCode(
      BuildContext context, startLoading, stopLoading, String otp) async {
    startLoading;
    _firebaseMessaging.getToken().then((token) async {
      // GetStorage getStorage = GetStorage();
      // username = getStorage.read('username');
      // sessionId = getStorage.read('sessionId');
      // print(username);
      // print(sessionId);

      // var res =
      //     await UserAPI().verifyOtp(context,username, sessionId, otp, token!, '1');
      // print(res);
      // if (res['status'] == 'OK') {
      //   //initializing storge
      //   GetStorage getStorage = GetStorage();
      //   getStorage.write("authCode", res['auth_code']);
      //   authCode = getStorage.read('authCode');
      //   print('AAuthCode');
      //   print(authCode);
      //   if (getStorage.read('authCode') != null) {
      //     authCode = (res['auth_code']);
      //     // print('AuthCode');
      //     // print(authCode);
      //     var check = await UserAPI().checkApi(context,authCode);
      //     print(check);
      //     if (check != null && check['status'] == 'OK') {
      //       getStorage.write(
      //           "contact_no", check['detail']['contact_no'].toString());
      //       getStorage.write("userId", check['detail']['id'].toString());
      //       getStorage.write(
      //           "username", check['detail']['username'].toString());
      //       if (check['detail']['email'] != null) {
      //         getStorage.write("email", check['detail']['email'].toString());
      //         startLoading;
      //         navigateTo(context, BottomNavigation());
      //         //here comes the Main Screen
      //       } else {
      //         startLoading;
      //         navigateTo(context, BottomNavigation());
      //         // Get.to(() => SignupPage(), binding: SignupBinding());
      //       }
      //     } else {
      //       stopLoading;

      //       createAlert(context, 'Error', res['error']);
      //     }
      //   } else {
      //     stopLoading;
      //     createAlert(context, 'Error', "No authcode found");
      //   }
      // } else {
      //   stopLoading;
      //   createAlert(context, '', "User Number is already exist in the vendor");
      // }
    });
  }

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  notificationPermission() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    print('Handling a background message ${message.notification}');
  }

  AndroidNotificationChannel? channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// <<<<<<  note  >>>>

  //getNotifications function declear in bottomnavigation in initstate
//getNotifications start
  getNotifications() {
    notificationPermission();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        if (message.data['type'] == 'news') {
        } else {}
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        // addNotification(message.notification.title, message.notification.body,
        //     message.notification.android.imageUrl);
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // channel!.description,
                // ignore: todo
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));

        print('Message data: ${message.data}');
        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message.data);

      if (message.data['type'] == 'news') {
        // showBarModalBottomSheet(
        //     expand: true,
        //     context: context,
        //     backgroundColor: Colors.transparent,
        //     builder: (context) => Container(
        //             // height: MediaQuery.of(context).size.height * 0.90,
        //             child: NotificationNewsDetails(
        //           authCode: authCode,
        //           newsId: message.data['newsId'].toString(),
        //         ))
        //     //NewsDetails(news: widget.news, authCode: widget.authCode)),
        //     );
      } else {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => MyNavigationBar()));
      }
    });
  }
// getNotifications end

//getMainNotifications function declare in main.dart file in main fuunction
//getMainNotifications start
  getMainNotifications() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        // 'This channel is used for important notifications.', // description
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin!
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel!);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    WidgetsFlutterBinding.ensureInitialized();
  }
  //getMainNotifications end

//getDynamiclink Start
  Future<void> getDynamiclink() async {
    //  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;
      print(deepLink);
      final postID = deepLink!.queryParameters['storeId'];
      print(postID); //will print "123"
      if (postID != null) {
        // Navigator.pushNamed(context, deepLink.path);
        // Get.to(() => StoreviewPage(storeId: int.parse(postID)));
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    print(deepLink);
    final postID = deepLink!.queryParameters['storeId'];
    print(postID); //will print "123"
    if (postID != null) {
      // Get.to(() => StoreviewPage(storeId: int.parse(postID)));
    }
    // }
  }
//getDynamiclink end

//getImage start

  static getImage(String type) async {
    late File? _image;

    late String url;
    final picker = ImagePicker();
    var pickedFile;
    if (type == 'camera') {
      pickedFile =
          await picker.getImage(source: ImageSource.camera, imageQuality: 80);
    } else if (type == 'gallery') {
      pickedFile =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 80);
    }
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [CropAspectRatioPreset.ratio16x9],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: tPrimaryColor,
            toolbarWidgetColor: tWhite,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    // setState(() {
    if (croppedFile != null) {
      File _file = File(croppedFile.path);
      print(_file.lengthSync());
      if (_file.lengthSync() < 20000000) {
        _image = File(croppedFile.path);
        print("_image");
        print(_image);
        return _image;
      } else {}
    } else {
      print('No image selected.');
    }
    // });

    if (croppedFile != null) {
      File _file = File(croppedFile.path);
      print(_file.lengthSync());
      // ignore: non_constant_identifier_names
      String ImageName = 'store-image-update';
      print("13" + ImageName);
      // ignore: unused_local_variable
      // String url;
      // Upload file
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child("$ImageName" + DateTime.now().toString());
      print(ref);

      UploadTask uploadTask = ref.putFile(_file);
      print(uploadTask);

      // setState(() => isLoading = true);
      uploadTask.then((resp) async {
        url = await resp.ref.getDownloadURL();
        print('Image url');
        print(url);
        return url;
        // setState(() {
        //   _loading = false;
        //   storeimage = url;
        //   print('storeimage');
        //   print(storeimage);
        //   _loading = true;
        // });
      });
    }
  }
//getImage end

  static createAlert(BuildContext context, error, errormsg) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error),
            content: Text(errormsg),
          );
        });
  }

  static willpopAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to exit?'),
          // content: SingleChildScrollView(
          //   child: ListBody(
          //     children: const <Widget>[
          //       Text('This is a demo alert dialog.'),
          //       Text('Would you like to approve of this message?'),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    navigateBack(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                        // gradient: tPrimaryGradientColor,
                        border: Border.all(width: 1, color: tPrimaryColor),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: tPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                        // gradient: tPrimaryGradientColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      'Ok',
                      style: TextStyle(color: tWhite),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  static navigateTo(BuildContext context, page) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static navigateBack(BuildContext context) async {
    Navigator.pop(context);
  }

  static errorHandler(BuildContext context, errorRes) async {
    switch (errorRes) {
      case 301:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Moved Permanently'),
        ));
        break;
      case 302:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Found'),
        ));
        break;
      case 401:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Unauthorized'),
        ));
        break;
      case 403:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Forbidden'),
        ));

        break;
      case 404:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Not Found'),
        ));
        break;
      case 500:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Internal Server Error'),
        ));
        break;
      case 502:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Bad Gateway'),
        ));
        break;
      case 503:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Service Unavailable'),
        ));

        break;
      case 504:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gateway Timeout'),
        ));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Oops!...'),
        ));
    }
  }

  // lunch url in webview
  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      print('Could not launch $url');
    }
  }

// force Navigate
  static forceNavigateTo(BuildContext context, page) async {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => page));
  }

// Date Formate
  dateFormate(now) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
