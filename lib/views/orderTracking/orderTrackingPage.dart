// import 'dart:async';

// import 'package:base_project_flutter/models/pin_pill_info.dart';
// import 'package:base_project_flutter/constants/constants.dart';
// import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sizer/sizer.dart';

// import '../../responsive.dart';

// const double CAMERA_ZOOM = 18;
// const double CAMERA_TILT = 80;
// const double CAMERA_BEARING = 30;

// class OrderTrackingScreen extends StatefulWidget {
//   OrderTrackingScreen({Key? key}) : super(key: key);

//   @override
//   _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
// }

// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   LatLng SOURCE_LOCATION = LatLng(17.448294, 78.391487);
//   LatLng DEST_LOCATION = LatLng(17.451293, 78.396568);
//   var sourceLat;
//   var sourceLng;
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> _markers = Set<Marker>();
// // for my drawn routes on the map
//   Set<Polyline> _polylines = Set<Polyline>();
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints? polylinePoints;
//   BitmapDescriptor? sourceIcon;
//   BitmapDescriptor? destinationIcon;

// // wrapper around the location API
//   Location? location;
//   double pinPillPosition = -100;
//   PinInformation currentlySelectedPin = PinInformation(
//       pinPath: '',
//       avatarPath: '',
//       location: LatLng(0, 0),
//       locationName: '',
//       labelColor: Colors.grey);
//   PinInformation? sourcePinInfo;
//   PinInformation? destinationPinInfo;

//   LocationData? currentLocation;

//   LocationData? destinationLocation;

//   @override
//   void initState() {
//     super.initState();

//     polylinePoints = PolylinePoints();

//     setSourceAndDestinationIcons();
//     // set the initial location
//     setInitialLocation();
//   }

//   void setSourceAndDestinationIcons() async {
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0),
//             'assets/images/driving_pin.png')
//         .then((onValue) {
//       sourceIcon = onValue;
//     });

//     BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0),
//             'assets/images/destination_map_marker.png')
//         .then((onValue) {
//       destinationIcon = onValue;
//     });
//   }

//   void setInitialLocation() async {
//     print('i am here');

//     FirebaseFirestore.instance
//         .collection('locations')
//         .doc('1')
//         .snapshots()
//         .listen((DocumentSnapshot documentSnapshot) {
//       print('<<<<< checking');
//       if (documentSnapshot.exists) {
//         Map<String, dynamic>? data =
//             documentSnapshot.data() as Map<String, dynamic>?;
//         sourceLat = data?['lat']; //
//         sourceLng = data?['lng']; //
//         print(sourceLat);
//         print(sourceLng);
//         setState(() {
//           sourceLat = data?['lat'];
//           sourceLng = data?['lng'];
//         });
//         updatePinOnMap();
//         // setPolylines();
//         print('Document data: ${documentSnapshot.data()}');
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//     destinationLocation = LocationData.fromMap({
//       "latitude": DEST_LOCATION.latitude,
//       "longitude": DEST_LOCATION.longitude
//     });
//     currentLocation =
//         LocationData.fromMap({"latitude": sourceLat, "longitude": sourceLng});
//     // await FirebaseFirestore.instance
//     //     .collection('locations')
//     //     .doc('1')
//     //     .get()
//     //     .then((DocumentSnapshot documentSnapshot) {
//     //   if (documentSnapshot.exists) {
//     //     print('Document data: ${documentSnapshot.data()}');
//     //   } else {
//     //     print('Document does not exist on the database');
//     //   }
//     // });
//     // set the initial location by pulling the user's
//     // current location from the location's getLocation()
//     // currentLocation = await location.getLocation();

//     // hard-coded destination for this example
//   }

//   @override
//   Widget build(BuildContext context) {
//     CameraPosition initialCameraPosition = CameraPosition(
//         zoom: CAMERA_ZOOM,
//         tilt: CAMERA_TILT,
//         bearing: CAMERA_BEARING,
//         target: SOURCE_LOCATION);
//     if (currentLocation != null) {
//       initialCameraPosition = CameraPosition(
//           target: LatLng(17.437462, 78.448288),
//           zoom: CAMERA_ZOOM,
//           tilt: CAMERA_TILT,
//           bearing: CAMERA_BEARING);
//     }
//     return Container(
//        margin: EdgeInsets.symmetric(horizontal: isDesktop(context)?10.w:0),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: tSecondaryColor,
//           flexibleSpace: Container(
//           decoration: const BoxDecoration(gradient: tAppBarGradientColor),
//         ),
//           elevation: 0,
//           leading: Builder(builder: (BuildContext context) {
//             return Row(
//               children: [
//                 IconButton(
//                   icon: new Image.asset(Images.BackIcon),
//                   onPressed: () {
//                    Twl.navigateBack(context);
//                   },
//                   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//                 ),
//               ],
//             );
//           }),
//           centerTitle: true,
//           title: Text(
//             'Track order',
//             style: TextStyle(
//                 fontSize: isDesktop(context) ? 4.sp :isTab(context)?10.sp: 18,
//                  color: tSecondaryBlack,
//                 fontWeight: FontWeight.w600),
//           ),
//           actions: [
//             TextButton(
//               child: Text(
//                 'Order Details',
//                 style: TextStyle(color: tPrimaryColor,fontSize:isDesktop(context) ? 4.sp : isTab(context)?8.sp:13.sp),
//                 textAlign: TextAlign.center,
//               ),
//               onPressed: () async {
//                 Twl.navigateTo(context,OrdersPage());
//               },
//             )
//           ],
//         ),
//         body: Stack(
//           children: [
//             sourceLat != null && sourceLng != null
//                 ? GoogleMap(
//                     myLocationEnabled: true,
//                     compassEnabled: true,
//                     tiltGesturesEnabled: false,
//                     markers: _markers,
//                     polylines: _polylines,
//                     mapType: MapType.normal,
//                     initialCameraPosition: initialCameraPosition,
//                     onTap: (LatLng loc) {
//                       pinPillPosition = -100;
//                     },
//                     onMapCreated: (GoogleMapController controller) {
//                       // controller.setMapStyle(Utils.mapStyles);
//                       _controller.complete(controller);
//                       // my map has completed being created;
//                       // i'm ready to show the pins on the map
//                       showPinsOnMap();
//                     })
//                 : Center(child: CircularProgressIndicator()),
//             // MapPinPillComponent(
//             //     pinPillPosition: pinPillPosition,
//             //     currentlySelectedPin: currentlySelectedPin)
//             Positioned(
//               top: 20,
//               left: 10,
//               right: 10,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: tDefaultPadding / 2, vertical: tDefaultPadding),
//                 decoration: BoxDecoration(
//                     boxShadow: [tBoxShadow],
//                     borderRadius: BorderRadius.circular(10),
//                     color: tWhite),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding:  EdgeInsets.only(left:isDesktop(context) ? 8.w :isTab(context)?70:30.0),
//                                 child: Image.asset(Images.OrderAcceptIcon),
//                               ),
//                               SizedBox(height: 10,),
//                               Text(
//                                 'Order Accepted',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: tSecondaryGary,
//                                     fontSize: isDesktop(context) ? 3.sp : 8.sp),
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(Images.PreparingBlackIcon),
//                               SizedBox(height: 10,),
//                               Text(
//                                 'Preparing Food',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: tSecondaryGary,
//                                     fontSize: isDesktop(context) ? 3.sp : 8.sp),
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                                Image.asset(Images.PreparingBlackIcon),
//                                SizedBox(height: 10,),
//                               Text(
//                                 'Food On the Way',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: tSecondaryGary,
//                                     fontSize: isDesktop(context) ? 3.sp : 8.sp),
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                                Padding(
//                                 padding:  EdgeInsets.only(right:isDesktop(context) ? 8.w :isTab(context)?70:30.0),
//                                 child: Image.asset(Images.DeliveredBlackIcon),
//                               ),
//                               SizedBox(height: 10,),
//                               Text(
//                                 'Delivered',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: tSecondaryGary,
//                                     fontSize: isDesktop(context) ? 3.sp : 8.sp),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Text(
//                         'Your order has been  placed.It will be delivered in very short time.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: tSecondaryBlack,
//                             fontSize: isDesktop(context) ? 3.sp :isTab(context)
//                                                               ? 9.sp: 12.sp),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
           
//             Positioned(
//               bottom: 20,
//               right: 20,
//               child: GestureDetector(
//                 onTap: () {
//                   showModalBottomSheet(
//                       // backgroundColor: Colors.transparent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20)),
//                       ),
//                       isScrollControlled: true,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Container(
//                           height:isDesktop(context) ? 400 : isTab(context)?600:300,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     width: 100,
//                                     height: 3,
//                                     decoration: BoxDecoration(
//                                         boxShadow: [tBoxShadow],
//                                         color: tSecondaryBlack,
//                                         borderRadius: BorderRadius.circular(2),
//                                         border: Border.all(
//                                             width: 2, color: tSecondaryBlack)),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: tDefaultPadding,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: tDefaultPadding / 2),
//                                 decoration: BoxDecoration(
//                                     boxShadow: [tBoxShadow],
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: tWhite),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 15,
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 'Raj Palace Restaurant',
//                                                 style: TextStyle(
//                                                     fontSize: isDesktop(context)
//                                                         ? 4.sp
//                                                         : isTab(context)
//                                                             ? 10.sp
//                                                             : 12.sp,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: tSecondaryBlack),
//                                               ),
//                                               SizedBox(
//                                                 width: tDefaultPadding / 2,
//                                               ),
//                                               Spacer(),
//                                               Image.asset(
//                                                 Images.PhoneIcon,
//                                                 width:isTab(context)?35: 25,
//                                               )
//                                             ],
//                                           ),  
//                                           if(isTab(context))SizedBox(
//                                             height: 15,
//                                           ),
//                                           Text(
//                                             'Ayyappa Society, Madhapur, Hyderabad',
//                                             style: TextStyle(
//                                                 fontSize: isDesktop(context)
//                                                     ? 4.sp
//                                                     : isTab(context)
//                                                         ? 8.sp
//                                                         : 8.sp,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: tSecondaryGary),
//                                           ),
//                                           SizedBox(
//                                             height: isTab(context)?15:10,
//                                           ),
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 5.0),
//                                                 child: Image.asset(
//                                                   Images.DotIcon,
//                                                   width:
//                                                       isDesktop(context) ? 10 :isTab(context)
//                                                               ? 10: 5,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width:isTab(context)
//                                                               ? tDefaultPadding: tDefaultPadding / 4,
//                                               ),
//                                               RichText(
//                                                 text: TextSpan(
//                                                   text: '3 ',
//                                                   style: TextStyle(
//                                                       color: tSecondaryBlack,
//                                                       fontWeight: FontWeight.bold,
//                                                       fontSize: isDesktop(context)
//                                                           ? 3.sp
//                                                           : isTab(context)
//                                                               ? 8.sp
//                                                               : 9.sp),
//                                                   children: <TextSpan>[
//                                                     TextSpan(
//                                                         text: ' Items'.toString(),
//                                                         style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 tSecondaryBlack,
//                                                             fontSize: isDesktop(
//                                                                     context)
//                                                                 ? 3.sp
//                                                                 : isTab(context)
//                                                                     ? 8.sp
//                                                                     : 9.sp)),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:  EdgeInsets.only(
//                                                     left: isTab(context)
//                                                               ? 20:5.0),
//                                                 child: Image.asset(
//                                                   Images.DotIcon,
//                                                   width:
//                                                       isDesktop(context) ? 10 :isTab(context)
//                                                               ? 10: 5,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width:isTab(context)
//                                                               ? tDefaultPadding: tDefaultPadding / 4,
//                                               ),
//                                               RichText(
//                                                 text: TextSpan(
//                                                   text: currencySymbol,
//                                                   style: TextStyle(
//                                                       color: tPrimaryColor,
//                                                       fontWeight: FontWeight.bold,
//                                                       fontSize: isDesktop(context)
//                                                           ? 3.sp
//                                                           : isTab(context)
//                                                               ? 8.sp
//                                                               : 9.sp),
//                                                   children: <TextSpan>[
//                                                     TextSpan(
//                                                         text: ' 300'.toString(),
//                                                         style: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 tSecondaryBlack,
//                                                             fontSize: isDesktop(
//                                                                     context)
//                                                                 ? 3.sp
//                                                                 : isTab(context)
//                                                                     ? 8.sp
//                                                                     : 9.sp)),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: tDefaultPadding / 2,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Divider(
//                                       color: tBackground,
//                                       thickness: 1,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15),
//                                       child: Text(
//                                         'Have any quiery contact restaurant..',
//                                         style: TextStyle(
//                                             fontSize: isDesktop(context)
//                                                 ? 4.sp
//                                                 : isTab(context)
//                                                     ? 8.sp
//                                                     : 8.sp,
//                                             fontWeight: FontWeight.w600,
//                                             color: tSecondaryGary),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: tDefaultPadding,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     boxShadow: [tBoxShadow],
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: tWhite),
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: tDefaultPadding / 2,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             Images.ClockBlackIcon,
//                                             width: isTab(context)
//                                                               ? 25:20,
//                                           ),
//                                           SizedBox(
//                                             width: 15,
//                                           ),
//                                           Text(
//                                             'Delivery in 25mins',
//                                             style: TextStyle(
//                                                 fontSize: isDesktop(context)
//                                                     ? 4.sp
//                                                     : isTab(context)
//                                                         ? 8.sp
//                                                         : 10.sp,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: tSecondaryBlack),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Divider(
//                                       color: tBackground,
//                                       thickness: 1,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             Images.LocationBlackIcon,
//                                             width:isTab(context)
//                                                               ? 25: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 15,
//                                           ),
//                                           Container(
//                                             width: 60.w,
//                                             child: Text(
//                                               '1st Floor, Spline Arcade, Flat no 102, Plot no 1208, Ayyappa Society...',
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: TextStyle(
//                                                   fontSize: isDesktop(context)
//                                                       ? 4.sp
//                                                       : isTab(context)
//                                                           ? 8.sp
//                                                           : 8.sp,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: tSecondaryGary),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: tDefaultPadding / 2,
//                                           vertical: 0),
//                                       decoration: BoxDecoration(
//                                           // color: tOrder,\
//                                           gradient: tPrimaryGradientColor,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(10),
//                                               bottomRight: Radius.circular(10))),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             height: isTab(context)
//                                                               ? 65:45,
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(50),
//                                               child: Image.network(
//                                                   'https://picsum.photos/250?image=9'),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   'Jenny Wilson',
//                                                   style: TextStyle(
//                                                       fontSize: isDesktop(context)
//                                                           ? 3.sp
//                                                           :isTab(context)
//                                                               ? 8.sp: 11.sp,
//                                                       color: tWhite,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                                 Text('+918328233273',
//                                                     style: TextStyle(
//                                                       fontSize: isDesktop(context)
//                                                           ? 3.sp
//                                                           : isTab(context)
//                                                               ? 8.sp:10.sp,
//                                                       color: tWhite,
//                                                     )),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Spacer(),
//                                           GestureDetector(
//                                             onTap: () {},
//                                             child: Image.asset(
//                                               Images.PhoneBlackIcon,
//                                               width: isTab(context)
//                                                               ? 35:25,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       });
//                 },
//                 child: Container(
//                     width:isTab(context)?80: 40,
//                     height:isTab(context)?80: 40,
//                     decoration: BoxDecoration(
//                         color: tWhite,
//                         boxShadow: [tSecondaryBoxShadow],
//                         borderRadius: BorderRadius.circular(50)),
//                     child: Icon(
//                       Icons.arrow_drop_up_rounded,
//                       color: tPrimaryColor,
//                       size: isTab(context)?80:40,
//                     )),
//               ),
//             ),
//             // Positioned(
//             //   bottom: 20,
//             //   left: 10,
//             //   right: 10,
//             //   child: Column(
//             //     children: [
//             //       Container(
//             //         padding: EdgeInsets.symmetric(vertical: tDefaultPadding / 2),
//             //         decoration: BoxDecoration(
//             //             boxShadow: [tBoxShadow],
//             //             borderRadius: BorderRadius.circular(10),
//             //             color: tWhite),
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Container(
//             //               padding: EdgeInsets.symmetric(
//             //                 horizontal: 15,
//             //               ),
//             //               child: Column(
//             //                 crossAxisAlignment: CrossAxisAlignment.start,
//             //                 children: [
//             //                   Row(
//             //                     crossAxisAlignment: CrossAxisAlignment.start,
//             //                     children: [
//             //                       Text(
//             //                         'Raj Palace Restaurant',
//             //                         style: TextStyle(
//             //                             fontSize: isDesktop(context)
//             //                                 ? 4.sp
//             //                                 : isTab(context)
//             //                                     ? 10.sp
//             //                                     : 12.sp,
//             //                             fontWeight: FontWeight.w600,
//             //                             color: tSecondaryBlack),
//             //                       ),
//             //                       SizedBox(
//             //                         width: tDefaultPadding / 2,
//             //                       ),
//             //                       Spacer(),
//             //                       Image.asset(
//             //                         Images.PhoneIcon,
//             //                         width: 25,
//             //                       )
//             //                     ],
//             //                   ),
//             //                   Text(
//             //                     'Ayyappa Society, Madhapur, Hyderabad',
//             //                     style: TextStyle(
//             //                         fontSize: isDesktop(context)
//             //                             ? 4.sp
//             //                             : isTab(context)
//             //                                 ? 10.sp
//             //                                 : 8.sp,
//             //                         fontWeight: FontWeight.w600,
//             //                         color: tSecondaryGary),
//             //                   ),
//             //                   SizedBox(
//             //                     height: 10,
//             //                   ),
//             //                   Row(
//             //                     crossAxisAlignment: CrossAxisAlignment.center,
//             //                     mainAxisAlignment: MainAxisAlignment.start,
//             //                     children: [
//             //                       Padding(
//             //                         padding: const EdgeInsets.only(left: 5.0),
//             //                         child: Image.asset(
//             //                           Images.DotIcon,
//             //                           width: isDesktop(context) ? 10 : 5,
//             //                         ),
//             //                       ),
//             //                       SizedBox(
//             //                         width: tDefaultPadding / 4,
//             //                       ),
//             //                       RichText(
//             //                         text: TextSpan(
//             //                           text: '3 ',
//             //                           style: TextStyle(
//             //                               color: tSecondaryBlack,
//             //                               fontWeight: FontWeight.bold,
//             //                               fontSize: isDesktop(context)
//             //                                   ? 3.sp
//             //                                   : isTab(context)
//             //                                       ? 8.sp
//             //                                       : 9.sp),
//             //                           children: <TextSpan>[
//             //                             TextSpan(
//             //                                 text: ' Items'.toString(),
//             //                                 style: TextStyle(
//             //                                     fontWeight: FontWeight.bold,
//             //                                     color: tSecondaryBlack,
//             //                                     fontSize: isDesktop(context)
//             //                                         ? 3.sp
//             //                                         : isTab(context)
//             //                                             ? 8.sp
//             //                                             : 9.sp)),
//             //                           ],
//             //                         ),
//             //                       ),
//             //                       Padding(
//             //                         padding: const EdgeInsets.only(left: 5.0),
//             //                         child: Image.asset(
//             //                           Images.DotIcon,
//             //                           width: isDesktop(context) ? 10 : 5,
//             //                         ),
//             //                       ),
//             //                       SizedBox(
//             //                         width: tDefaultPadding / 4,
//             //                       ),
//             //                       RichText(
//             //                         text: TextSpan(
//             //                           text: currencySymbol,
//             //                           style: TextStyle(
//             //                               color: tPrimaryColor,
//             //                               fontWeight: FontWeight.bold,
//             //                               fontSize: isDesktop(context)
//             //                                   ? 3.sp
//             //                                   : isTab(context)
//             //                                       ? 8.sp
//             //                                       : 9.sp),
//             //                           children: <TextSpan>[
//             //                             TextSpan(
//             //                                 text: ' 300'.toString(),
//             //                                 style: TextStyle(
//             //                                     fontWeight: FontWeight.bold,
//             //                                     color: tSecondaryBlack,
//             //                                     fontSize: isDesktop(context)
//             //                                         ? 3.sp
//             //                                         : isTab(context)
//             //                                             ? 8.sp
//             //                                             : 9.sp)),
//             //                           ],
//             //                         ),
//             //                       )
//             //                     ],
//             //                   ),
//             //                   SizedBox(
//             //                     width: tDefaultPadding / 2,
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //             Divider(
//             //               color: tBackground,
//             //               thickness: 1,
//             //             ),
//             //             Padding(
//             //               padding: const EdgeInsets.symmetric(horizontal: 15),
//             //               child: Text(
//             //                 'Have any quiery contact restaurant..',
//             //                 style: TextStyle(
//             //                     fontSize: isDesktop(context)
//             //                         ? 4.sp
//             //                         : isTab(context)
//             //                             ? 10.sp
//             //                             : 8.sp,
//             //                     fontWeight: FontWeight.w600,
//             //                     color: tSecondaryGary),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       SizedBox(
//             //         height: tDefaultPadding,
//             //       ),
//             //       Container(
//             //         decoration: BoxDecoration(
//             //             boxShadow: [tBoxShadow],
//             //             borderRadius: BorderRadius.circular(10),
//             //             color: tWhite),
//             //         child: Column(
//             //           children: [
//             //             SizedBox(
//             //               height: tDefaultPadding / 2,
//             //             ),
//             //             Padding(
//             //               padding: const EdgeInsets.symmetric(horizontal: 15),
//             //               child: Row(
//             //                 children: [
//             //                   Image.asset(
//             //                     Images.ClockBlackIcon,
//             //                     width: 20,
//             //                   ),
//             //                   SizedBox(
//             //                     width: 15,
//             //                   ),
//             //                   Text(
//             //                     'Delivery in 25mins',
//             //                     style: TextStyle(
//             //                         fontSize: isDesktop(context)
//             //                             ? 4.sp
//             //                             : isTab(context)
//             //                                 ? 10.sp
//             //                                 : 10.sp,
//             //                         fontWeight: FontWeight.w600,
//             //                         color: tSecondaryBlack),
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //             Divider(
//             //               color: tBackground,
//             //               thickness: 1,
//             //             ),
//             //             Padding(
//             //               padding: const EdgeInsets.symmetric(horizontal: 15),
//             //               child: Row(
//             //                 children: [
//             //                   Image.asset(
//             //                     Images.LocationBlackIcon,
//             //                     width: 20,
//             //                   ),
//             //                   SizedBox(
//             //                     width: 15,
//             //                   ),
//             //                   Container(
//             //                     width: 60.w,
//             //                     child: Text(
//             //                       '1st Floor, Spline Arcade, Flat no 102, Plot no 1208, Ayyappa Society...',
//             //                       maxLines: 2,
//             //                       overflow: TextOverflow.ellipsis,
//             //                       style: TextStyle(
//             //                           fontSize: isDesktop(context)
//             //                               ? 4.sp
//             //                               : isTab(context)
//             //                                   ? 10.sp
//             //                                   : 8.sp,
//             //                           fontWeight: FontWeight.w600,
//             //                           color: tSecondaryGary),
//             //                     ),
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //             SizedBox(
//             //               height: 10,
//             //             ),
//             //             Container(
//             //               padding: EdgeInsets.symmetric(
//             //                   horizontal: tDefaultPadding / 2, vertical: 0),
//             //               decoration: BoxDecoration(
//             //                   // color: tOrder,\
//             //                   gradient: tPrimaryGradientColor,
//             //                   borderRadius: BorderRadius.only(
//             //                       bottomLeft: Radius.circular(10),
//             //                       bottomRight: Radius.circular(10))),
//             //               child: Row(
//             //                 children: [
//             //                   Container(
//             //                     height: 45,
//             //                     child: ClipRRect(
//             //                       borderRadius: BorderRadius.circular(50),
//             //                       child: Image.network(
//             //                           'https://picsum.photos/250?image=9'),
//             //                     ),
//             //                   ),
//             //                   SizedBox(
//             //                     width: 10,
//             //                   ),
//             //                   Padding(
//             //                     padding: const EdgeInsets.all(8.0),
//             //                     child: Column(
//             //                       mainAxisAlignment: MainAxisAlignment.start,
//             //                       crossAxisAlignment: CrossAxisAlignment.start,
//             //                       children: [
//             //                         Text(
//             //                           'Jenny Wilson',
//             //                           style: TextStyle(
//             //                               fontSize:
//             //                                   isDesktop(context) ? 3.sp : 11.sp,
//             //                               color: tWhite,
//             //                               fontWeight: FontWeight.w600),
//             //                         ),
//             //                         SizedBox(
//             //                           height: 5,
//             //                         ),
//             //                         Text('+918328233273',
//             //                             style: TextStyle(
//             //                               fontSize:
//             //                                   isDesktop(context) ? 3.sp : 10.sp,
//             //                               color: tWhite,
//             //                             )),
//             //                         SizedBox(
//             //                           height: 5,
//             //                         ),
//             //                       ],
//             //                     ),
//             //                   ),
//             //                   Spacer(),
//             //                   GestureDetector(
//             //                     onTap: () {},
//             //                     child: Image.asset(
//             //                       Images.PhoneBlackIcon,
//             //                       width: 25,
//             //                     ),
//             //                   )
//             //                 ],
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       )
//             //     ],
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   void showPinsOnMap() {
//     // get a LatLng for the source location
//     // from the LocationData currentLocation object
//     var pinPosition = LatLng(sourceLat, sourceLng);
//     // get a LatLng out of the LocationData object
//     var destPosition =
//         LatLng(destinationLocation!.latitude!, destinationLocation!.longitude!);

//     sourcePinInfo = PinInformation(
//         locationName: "Start Location",
//         location: SOURCE_LOCATION,
//         pinPath: "assets/images/driving_pin.png",
//         avatarPath: "assets/friend1.jpg",
//         labelColor: Colors.blueAccent);

//     destinationPinInfo = PinInformation(
//         locationName: "End Location",
//         location: DEST_LOCATION,
//         pinPath: "assets/images/destination_map_marker.png",
//         avatarPath: "assets/friend2.jpg",
//         labelColor: Colors.purple);

//     // add the initial source location pin
//     _markers.add(Marker(
//         markerId: MarkerId('sourcePin'),
//         position: pinPosition,
//         onTap: () {
//           setState(() {
//             currentlySelectedPin = sourcePinInfo!;
//             pinPillPosition = 0;
//           });
//         },
//         icon: sourceIcon!));
//     // destination pin
//     _markers.add(Marker(
//         markerId: MarkerId('destPin'),
//         position: destPosition,
//         onTap: () {
//           setState(() {
//             currentlySelectedPin = destinationPinInfo!;
//             pinPillPosition = 0;
//           });
//         },
//         icon: destinationIcon!));
//     // set the route lines on the map from source to destination
//     // for more info follow this tutorial
//     setPolylines();
//   }

//   void setPolylines() async {
//     print('polylines');
//     PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
//       mapKey,
//       PointLatLng(sourceLat, sourceLng),
//       PointLatLng(
//           destinationLocation!.latitude!, destinationLocation!.longitude!),
//       travelMode: TravelMode.driving,
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//       setState(() {
//         _polylines.add(Polyline(
//             width: 5, // set the width of the polylines
//             polylineId: PolylineId("poly"),
//             color: tPrimaryColor,
//             points: polylineCoordinates));
//       });
//     }
//   }

//   void updatePinOnMap() async {
//     // create a new CameraPosition instance
//     // every time the location changes, so the camera
//     // follows the pin as it moves with an animation
//     CameraPosition cPosition = CameraPosition(
//       zoom: CAMERA_ZOOM,
//       tilt: CAMERA_TILT,
//       bearing: CAMERA_BEARING,
//       target: LatLng(sourceLat, sourceLng),
//     );
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
//     // do this inside the setState() so Flutter gets notified
//     // that a widget update is due
//     setState(() {
//       polylineCoordinates.clear();
//       setPolylines();
//       // setPolylines();
//       // updated position
//       var pinPosition = LatLng(sourceLat, sourceLng);

//       sourcePinInfo!.location = pinPosition;

//       // the trick is to remove the marker (by id)
//       // and add it again at the updated location
//       _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
//       _markers.add(Marker(
//           markerId: MarkerId('sourcePin'),
//           onTap: () {
//             setState(() {
//               currentlySelectedPin = sourcePinInfo!;
//               pinPillPosition = 0;
//             });
//           },
//           position: pinPosition, // updated position
//           icon: sourceIcon!));
//     });
//   }
// }
