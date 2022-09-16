// import 'package:base_project_flutter/constants/constants.dart';
// import 'package:base_project_flutter/constants/imageConstant.dart';
// import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
// import 'package:base_project_flutter/views/homePage/homePage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import '../../responsive.dart';

// class WebHeader extends StatefulWidget {
//   WebHeader({Key? key, this.formattedAddress}) : super(key: key);
//   final formattedAddress;
  
//   @override
//   State<WebHeader> createState() => _WebHeaderState();
// }

// class _WebHeaderState extends State<WebHeader> {
  
//   int menuIndex =0;


//   @override
//   void initState() {
//     visible(BuildContext context){
//       //  WebProvider _data = Provider.of<WebProvider>(context);
//       //  _data.setvisibleHeader(context, false);
      
//     }
//     // TODO: implement initState
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     // WebProvider _data = Provider.of<WebProvider>(context);
//     return
//      Container(
//        margin: EdgeInsets.symmetric(horizontal:kIsWeb? 10.w:0),
//        child: Scaffold(
//          body: SingleChildScrollView(
//            child: Column(
//              children: [
//               if(isDesktop(context)) Header(formattedAddress: '', menu: _data.menu, data: _data),
//               //  if(_data.menuIndex != 5)
//                Container(
//                  height: 100.h,
//                 //  child:_data.menuIndex ==0? HomePage():_data.menuIndex ==1? NearByRestaurants():_data.menuIndex ==2?CategoriesPage():_data.menuIndex ==3?CartPage():_data.menuIndex ==4 ? Darwer():Container(),
//                ),
//               //  if(_data.count =='Popular')Container(
//               //    child: Container(
//               //       height: 100.h,
//               //      child: PopularRestaurant()),
//               //  ),
//               //   if(_data.count =='Rest')Container(
//               //    child: Container(
//               //       height: 100.h,
//               //      child: RestaurantView(nearbyResId: _data.id.toString(),)),
//               //  ),
//               //  Container(
//               //    child:NearByRestaurants() ,
//               //  ),
//               //  Container(
//               //    child:RestaurantView() ,
//               //  )
//              ],
//            ),
//          ),
//          ),
//      );
//   }
// }

// class Header extends StatelessWidget {
//   const Header({
//     Key? key,
//     required this.formattedAddress,
//     required this.menu,
//     required WebProvider data,
//   }) : _data = data, super(key: key);

//   final  formattedAddress;
//   final List menu;
//   final WebProvider _data;
   

//   @override
//   Widget build(BuildContext context) {
//     List menuImage =[
//      Images.HomeSelected,
//      Images.NearbySelected,
//      Images.NearbySelected,
//      Images.CartSelected,
//      Images.ProfileSelected
     
//    ];
//     return Container(
//       // color: tSecondaryBlack,
//       decoration: BoxDecoration(gradient: tAppBarGradientColor),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             flex:isDesktop(context)?8:4,
//             child: Row(
//               children: [
//                 IconButton(
//                icon: new Image.asset(Images.LocationMenu),
//                onPressed: () {
//                  Scaffold.of(context).openDrawer();
//                },
//                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//              ),
//               GestureDetector(
//            onTap: () async {
//              Twl.navigateTo(context, GoogleMapPage());
//            },
//            child: Container(
//                // width: MediaQuery.of(context).size.width * 0.50,
//                child: formattedAddress == null
//                    ? Row(
//                        children: [
//                          Text(
//                            'addressLine != null ? addressLine! : ''',
//                            overflow: TextOverflow.ellipsis,
//                            maxLines: 2,
//                            style: TextStyle(
//                                fontSize: isTab(context) ? 8.sp :isDesktop(context)?3.sp: 10.sp,
//                                fontWeight: FontWeight.w500,
//                                color: tWhite),
//                          ),
//                          Image.asset(
//                            Images.DownArrowIcon,
//                            width: isTab(context) ? 25 : 20,
//                          )
//                        ],
//                      )
//                    : Row(
//                        children: [
//                          Container(
//                            width: 20.w,
//                            child: Text(
//                              'formattedAddress != null ? formattedAddress! : ''',
//                              overflow: TextOverflow.ellipsis,
//                              maxLines: 2,
//                              style: TextStyle(
//                                  fontSize:isDesktop(context)?3.sp: 10.sp,
//                                  fontWeight: FontWeight.w500,
//                                  color: tWhite),
//                            ),
//                          ),
//                          Image.asset(
//                            Images.DownArrowIcon,
//                            width: 20,
//                          )
//                        ],
//                      ))),
//               ],
//             )
//          ),
         
//          Expanded(
//            flex: 6,
     
//            child: Container(
//              alignment: Alignment.centerRight,
//              height: 50,
//              child: ListView.builder(
//                 itemCount: menu.length,
//                 scrollDirection: Axis.horizontal,
//                itemBuilder: (BuildContext context,index) {
//                  return GestureDetector(
//                  onTap: () async {
//                    _data.setIndex(context,index);

//                    // setState(() {
//                    //   menuIndex =index;
//                    // });
//                    Twl.navigateTo(context, WebHeader());
//                     _data.setvisibleHeader(context, false);
//                  },
//                  child: Padding(
//                    padding:  EdgeInsets.only(right:2.w),
//                    child: Container(
//                      alignment: Alignment.center,
//                      child: Row(
//                        children: [
//                          Image.asset(menuImage[index],width: 20,),
//                          SizedBox(width: 4,),
//                          Text(
//                            menu[index],
//                            overflow: TextOverflow.ellipsis,
//                            maxLines: 2,
//                            style: TextStyle(
//                                fontSize: isTab(context) ? 8.sp :isDesktop(context)?3.sp: 10.sp,
//                                fontWeight: FontWeight.w500,
//                                color:  _data.menuIndex ==index ?tPrimaryColor:tWhite),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//          );
//                }
//              ),
//            ),
         
//          ),
        
//          if(isTab(context))Expanded(
//            flex:2,
//            child: IconButton(
//            icon: new Image.asset(Images.MenuIcon),
//            onPressed: () async {
//              // print(sharedPreferences.getString("authCode"));
//            },
//          ),)
//         ],
//       ),
//     );
//   }
// }