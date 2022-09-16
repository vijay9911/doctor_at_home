// ignore_for_file: deprecated_member_use

import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/views/bottomNavigation.dart/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({Key? key}) : super(key: key);
  static final kInitialPosition = LatLng(28.7041, 77.1025);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
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
      body: Center(
          child: PlacePicker(
        apiKey: mapKey,
        hintText: "Find a place ...",
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
          formattedAddress = sharedPreferences.getString('formattedAddress')!;
          lat = sharedPreferences.getDouble('lattitude')!;
          lng = sharedPreferences.getDouble('longitude')!;
          print(selectedPlace!.addressComponents!.length);
          print(formattedAddress);
          print(lat);
          print(lng);
          // var latLng = {
          //   'lat': lat,
          //   'lng': lng,
          // };
          // getStorage.write("latLng", latLng);
          // latLng = getStorage.read('latLng');

          //  print(latLng);
          try {
            for (var i = 0; i < selectedPlace!.addressComponents!.length; i++) {
              for (var j = 0;
                  j < selectedPlace!.addressComponents![i].types.length;
                  j++) {
                //        print('here');
                // print(selectedPlace!.addressComponents![i].types[j]);
                if (selectedPlace!.addressComponents![i].types[j] ==
                        "postal_code" ||
                    selectedPlace!.addressComponents![i].types[j] ==
                        "postal_code_prefix") {
                  postalCode = selectedPlace!.addressComponents![i].shortName;

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
            throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                  'we are anable to find your pincode. please drag the place picker'),
            ));
          }

          // Twl.navigateTo(context, BottomNavigation());
        },

        // forceSearchOnZoomChanged: true,
        // automaticallyImplyAppBarLeading: false,
        // autocompleteLanguage: "ko",
        region: 'in',
      )),
    );
  }
}
