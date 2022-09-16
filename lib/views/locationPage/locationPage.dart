// ignore_for_file: deprecated_member_use

import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/globalFuctions/googleMaps.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/adddetailsPage/adddetailsPage.dart';
import 'package:base_project_flutter/views/bottomNavigation.dart/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);
  static final kInitialPosition = LatLng(17.3850, 78.4867);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  PickResult? selectedPlace;
  late double lat;
  late double lng;
  late String formattedAddress;
  String? postalCode;
  String? pinCode;
  late String streetName1;
  late String streetName2;
  late String streetName3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: PlacePicker(
            apiKey: mapKey,

            searchingText: "Please wait ...",
            selectText: "Select Location",
            outsideOfPickAreaText: "Place not in area",
            initialPosition: GoogleMapPage.kInitialPosition,
            useCurrentLocation: true,
            selectInitialPosition: true,
            usePinPointingSearch: true,
            usePlaceDetailSearch: true,
            onPlacePicked: (result) async {
              selectedPlace = result;
              print(selectedPlace!.formattedAddress);
              print(selectedPlace!.geometry!.location.lat);
              print(selectedPlace!.geometry!.location.lng);
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              // GetStorage getStorage = GetStorage();
              sharedPreferences.setString(
                  "formattedAddress", selectedPlace!.formattedAddress!);
              sharedPreferences.setDouble(
                  "lattitude", selectedPlace!.geometry!.location.lat);
              sharedPreferences.setDouble(
                  "longitude", selectedPlace!.geometry!.location.lng);
              formattedAddress =
                  sharedPreferences.getString('formattedAddress')!;
              lat = sharedPreferences.getDouble('lattitude')!;
              lng = sharedPreferences.getDouble('longitude')!;
              print(selectedPlace!.addressComponents!.length);
              print(formattedAddress);
              print(lat);
              print(lng);
               var latLng = {
                 'lat': lat,
                 'lng': lng,
               };
               var getStorage;
               getStorage.write("latLng", latLng);
               latLng = getStorage.read('latLng');

                print(latLng);
              try {
                for (var i = 0;
                    i < selectedPlace!.addressComponents!.length;
                    i++) {
                  for (var j = 0;
                      j < selectedPlace!.addressComponents![i].types.length;
                      j++) {
                    //        print('here');
                    // print(selectedPlace!.addressComponents![i].types[j]);
                    if (selectedPlace!.addressComponents![i].types[j] ==
                            "postal_code" ||
                        selectedPlace!.addressComponents![i].types[j] ==
                            "postal_code_prefix") {
                      postalCode =
                          selectedPlace!.addressComponents![i].shortName;

                      sharedPreferences.setString("postalCode", postalCode!);
                      postalCode = sharedPreferences.getString('postalCode');
                      print("post" + postalCode.toString());
                    }
                  }
                }

                streetName1 = selectedPlace!.addressComponents![1].longName;
                streetName2 = selectedPlace!.addressComponents![3].longName;
                streetName3 = selectedPlace!.addressComponents![5].longName;
                // postalCode = selectedPlace!.addressComponents![7].longName;
                // streetName = selectedPlace!.addressComponents![3].longName;
                // var address = selectedPlace!.addressComponents![i].types.length;
                sharedPreferences.setString("streetName1", streetName1);
                streetName1 = sharedPreferences.getString('streetName1')!;

                sharedPreferences.setString("streetName2", streetName2);
                streetName2 = sharedPreferences.getString('streetName2')!;
                print("streetName2:-" + streetName2);
                sharedPreferences.setString("streetName3", streetName3);
                streetName3 = sharedPreferences.getString('streetName3')!;

                print("streetName1:-" + streetName1);
                print(streetName2);
                print("streetName3:-" + streetName3);
                var cityaddress = streetName2;
                var fulladdress = streetName1 + streetName2 + streetName3;
                print(cityaddress);
                // print(fulladdress);
                sharedPreferences.setString("AddressLine", fulladdress);
                sharedPreferences.setString("cityaddress", cityaddress);
                var address = sharedPreferences.getString('AddressLine');
                print(address);
                // print('postalCode');
                // print(postalCode);

                if (postalCode != null) {
                  var res;
                  //  =
                  //     await UserAPI().checkDelivery(context, postalCode.toString());
                  if (res['status'] == 'OK' && res != null) {
                    //Redirect to Home Page
                    Twl.navigateTo(context, BottomNavigation());
                  } else {
                    //
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select another Location"),
                          content: Text(
                              "We do not currently deliver to your phone's current location. Please select an address to check if we deliver in your area"),
                          actions: <Widget>[
                            FloatingActionButton(
                              child: Text('ok'),
                              onPressed: () {
                                Twl.navigateBack(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  //
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Check Location"),
                        content: Text('We able to get your Pincode'),
                        actions: <Widget>[
                          FloatingActionButton(
                            child: Text('ok'),
                            onPressed: () {
                              Twl.navigateBack(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              } catch (e) {
                throw ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                        'we are anable to find your pincode. please drag the place picker'),
                  ),
                );
              }

              Twl.navigateTo(context, BottomNavigation());
            },

            // forceSearchOnZoomChanged: true,
            // automaticallyImplyAppBarLeading: false,
            // autocompleteLanguage: "ko",
            region: 'in',
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 260,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                height: 35.h,
                width: 98.5.w,
                decoration: BoxDecoration(
                    boxShadow: [tCardBoxShadow],
                    color: tWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Delivery Location",
                            style: TextStyle(
                                fontSize: isTab(context) ? 9.sp : 12.sp,
                                fontWeight: FontWeight.w700,color: tPrimaryColor),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: tPrimaryColor),
                                color: tWhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                  fontSize: isTab(context) ? 5.sp : 8.sp,
                                  fontWeight: FontWeight.w400,
                                  color: tPrimaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.LOCATION,
                            scale: 2.5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Madhapur",
                            style: TextStyle(
                                fontSize: isTab(context) ? 9.sp : 12.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Techweblabs Ayyapa Society Madhapur, Hyderabad, Telangana",
                        style: TextStyle(
                            fontSize: isTab(context) ? 5.sp : 8.sp,
                            fontWeight: FontWeight.w400,
                            color: tGray),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: tGray,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          locationTypeWidget(Images.LOCATIONHOME, 'Home', 0),
                          locationTypeWidget(Images.WORK, 'Work', 1),
                          locationTypeWidget(Images.OFFICE, 'Office', 2),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Twl.navigateTo(context, AddDetailsPage());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [tCardBoxShadow],
                            gradient: tSecondaryGradient,
                            // color: tPrimaryColor
                          ),
                          child: Center(
                            child: Text(
                              "Confirm Location",
                              style: TextStyle(
                                  fontSize: isTab(context) ? 11.sp : 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: tWhite),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  int selectedIndex = 0;
  Widget locationTypeWidget(String imageUrl, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index
                  ? tPrimaryColor
                  : locationPageselectColor,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              scale: 4.5,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: isTab(context) ? 7.sp : 10.sp,
                fontWeight: FontWeight.w700,
                color: selectedIndex == index
                    ? tPrimaryColor
                    : locationPageselectColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
