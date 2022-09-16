// ignore_for_file: import_of_legacy_library_into_null_safe, unused_field, unused_local_variable, deprecated_member_use, unnecessary_null_comparison

import 'package:app_settings/app_settings.dart';
import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/globalFuctions/googleMaps.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/bottomNavigation.dart/bottomNavigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart' as locater;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../api_services/userApi.dart';

class LocationErrorScreen extends StatefulWidget {
  LocationErrorScreen({Key? key, this.authCode}) : super(key: key);
  final authCode;
  @override
  _LocationErrorScreenState createState() => _LocationErrorScreenState();
}

class _LocationErrorScreenState extends State<LocationErrorScreen> {
  LatLng? _center;
  locater.Position? currentLocation;
  String? _currentAddress;
  bool isLoading = false;
  bool deliveryAddress = true;
  SharedPreferences? sharedPreferences;
  bool isLocationEnabled = false;
  @override
  void initState() {
    super.initState();
     _checkGps();
     locateUser();
    determinePosition();
    getUserLocation();
  }

  Future locateUser() async {
    setState(() {
      isLoading = true;
    });
     if ((await locater.Geolocator.isLocationServiceEnabled())) {
    locater.Position position = await locater.Geolocator.getCurrentPosition(
        desiredAccuracy: locater.LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    try {
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      setState(() {
        _currentAddress =
            "${first.locality}, ${first.featureName},${first.postalCode}, ${first.addressLine}";
      });
      //check delivery

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setDouble('lattitude', position.latitude);
      var lat = sharedPreferences.getDouble('lattitude');
      sharedPreferences.setDouble('longitude', position.longitude);
      var long = sharedPreferences.getDouble('longitude');
      sharedPreferences.setString('FeatureName', first.featureName);
      var featureName = sharedPreferences.getString('FeatureName');
      sharedPreferences.setString('AddressLine', first.addressLine);
      var addressLine = sharedPreferences.getString('AddressLine');
      sharedPreferences.setString('Locality', first.locality);
      var locality = sharedPreferences.getString('Locality');

      setState(() {
        isLoading = true;
      });
      //Check delivery
      var res;
       res= await UserAPI().checkDelivery(context, '500081',
       first.postalCode
      );
      if (res['status'] == 'OK' && res != null) {
        //Redirect to Home Page
        Twl.navigateTo(context, BottomNavigation());
      } else {
        //
        setState(() {
          isLoading = false;
          deliveryAddress = false;
        });
      }
    } catch (e) {
      Twl.createAlert(context, 'error', e.toString());
       //Get.snackbar("error", e.toString());
    }
     } else {
        _checkGps();
     }
      await _checkGps();
  }

  getUserLocation() async {
    setState(() {
      isLoading = false;
    });
    currentLocation = await locateUser();

    // print('center $_center');
  }

  determinePosition() async {
    locater.LocationPermission permission;
    permission = await locater.Geolocator.checkPermission();
    if (permission == locater.LocationPermission.denied) {
      permission = await locater.Geolocator.requestPermission();
      if (permission == locater.LocationPermission.deniedForever) {
          locater.LocationPermission permission = await locater.Geolocator.requestPermission();
        await openAppSettings();
        return Future.error('Location Not Available');
      }
    } else {
      return getUserLocation();
    }
    return await getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Twl.willpopAlert(context);
      },
      child: Scaffold(
        // backgroundColor: tLocation,
        body: Stack(
          children: [
            Center(
              child: isLoading == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (currentLocation != null)
                          Text(currentLocation.toString()),
                          Image.asset(Images.LocationenableIcon),
                        if (_currentAddress != null)
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: tDefaultPadding * 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: tDefaultPadding * 2),
                                decoration: BoxDecoration(
                                    color: tWhite,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    deliveryAddress
                                        ? Image.asset(
                                            Images.LocationenableIcon,
                                            width: 30.w,
                                          )
                                        : Image.asset(
                                            Images.LOCATION,
                                            width: 30.w,
                                          ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    Text(
                                      deliveryAddress
                                          ? "Deliver To"
                                          : "We do not currently deliver to your phone's current location. Please select an address to check if we deliver in your area",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              isDesktop(context) ? 3.sp : 14.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: tDefaultPadding * 2),
                                      child: Text(
                                        _currentAddress!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: isDesktop(context)
                                                ? 3.sp
                                                : 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    deliveryAddress
                                        ? Container()
                                        : GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      tDefaultPadding * 2,
                                                  vertical:
                                                      tDefaultPadding / 2),
                                              decoration: BoxDecoration(
                                                  // gradient: tPrimaryGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Text(
                                                'Change Location',
                                                style: TextStyle(
                                                  color: tWhite,
                                                ),
                                              ),
                                            ),
                                            onTap: () async {
                                              Twl.navigateTo(
                                                  context, GoogleMapPage());
                                            },
                                          )
                                  ],
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: tDefaultPadding * 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: tDefaultPadding * 2),
                                decoration: BoxDecoration(
                                    color: tWhite,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Images.LocationenableIcon,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    Text(
                                      "Enable Your Location",
                                      style: TextStyle(
                                          fontSize:
                                              isDesktop(context) ? 3.sp : 14.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: tDefaultPadding * 2),
                                      child: Text(
                                        "Please allow to use your location ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: isDesktop(context)
                                                ? 3.sp
                                                : 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: tDefaultPadding,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: tDefaultPadding * 2,
                                            vertical: tDefaultPadding / 2),
                                        decoration: BoxDecoration(
                                            // gradient: tPrimaryGradient,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          'Enable Location',
                                          style: TextStyle(
                                            color: tWhite,
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        await determinePosition();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        isLocationEnabled != null ? Container() : FloatingActionButton(
                                // elevation: 0,

                                child: Text('app_settings'),
                                onPressed: AppSettings.openLocationSettings,
                              ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: tDefaultPadding * 2),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: tDefaultPadding * 2),
                              decoration: BoxDecoration(
                                  color: tWhite,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.LocationenableIcon,
                                    width: 30.w,
                                  ),
                                  SizedBox(
                                    height: tDefaultPadding,
                                  ),
                                  SpinKitThreeBounce(
                                    color: tPrimaryColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            if (kIsWeb)
              Positioned(
                top: 20,
                right: 15,
                child: Container(
                  alignment: Alignment.centerRight,
                  // width: 30.w,
                  child: GestureDetector(
                    onTap: () {
                      Twl.navigateTo(context, BottomNavigation());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: isTab(context) ? 100 : 60,
                      height: isTab(context) ? 40 : 25,
                      decoration: BoxDecoration(
                          color: tWhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "skip",
                        style: TextStyle(color: tPrimaryColor, fontSize: 12.sp),
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

_checkGps() {
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void determinePosition() {}

  void getUserLocation() {}

