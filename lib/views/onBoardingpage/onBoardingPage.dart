import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:base_project_flutter/responsive.dart';
import 'package:base_project_flutter/views/logiPage/loginPage.dart';
import '../../constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends StatefulWidget {
   OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
var currentPage = 0;

bool get isLastPage => currentPage == splashData.length -1;

var pageControll = PageController();

 late List <Map<String,String>> splashData=[
{
  'title':'Store or Individual',
  'suntitle':'Register yourself if you own a store or provide professional services as an individual',
  // 'image':Images.OnBoardScreen1,
},

{
  'title':'Offers',
  'suntitle':'Let the world know the offers you provide for the products or services you sell.',
  // 'image':Images.OnBoardScreen2
},
{
  'title':'Connect',
  'suntitle':'Connect with your customers like never before and gain the returns you deserve.',
  // 'image':
}
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                  onPageChanged:  (page) {
                  setState(() {
                    currentPage = page;
                  });},
                  controller: pageControll,
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return OnboardingWidget(
                      title: splashData[index]['title'],
                      subtitle: splashData[index]['suntitle'],
                      // image: introController.splashData[index]['image'],
                      titlecolor: tSecondaryColor,
                      subtitlecolor: tGray,
                      height: 20.w,
                    );
                  }),
              Column(
                children: [
                  Spacer(),
                  Container(
                      alignment: Alignment.center,
                      color: tWhite,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  // width: 50.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: List.generate(
                                        splashData.length,
                                        (index) => Container(
                                                margin: EdgeInsets.all(5),
                                                height: 6,
                                                width:currentPage ==
                                                        index
                                                    ? 20
                                                    : 20,
                                                decoration: BoxDecoration(
                                                    color: currentPage==
                                                            index
                                                        ? tPrimaryColor
                                                        : Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                            )),
                                  ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.centerRight,
                                  // width: 30.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Twl.navigateTo(context, LoginPage());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width:isTab(context)?100 : 60,
                                      height:isTab(context)?40 : 25,
                                      decoration: BoxDecoration(
                                          color: tPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "skip",
                                        style: TextStyle(color: tWhite,fontSize:  12.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              ])))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// class OnboardingPage extends StatefulWidget {

// }

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {Key? key,
      this.title,
      this.subtitle,
      this.image,
      this.title2,
      this.titlecolor,
      this.height,
      this.subtitlecolor})
      : super(key: key);
  final String? title;
  final String? title2;
  final String? subtitle;
  final image;
  final titlecolor;
  final height;
  final subtitlecolor;
  get tprimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FlutterLogo(size: 65.h,),
          // Image.asset(
          //   image,
          //   height: MediaQuery.of(context).size.height * 0.57,
          //   width: MediaQuery.of(context).size.width,
          //   fit: BoxFit.fill,
          // ),
          SizedBox(
            height: height,
          ),
          Text(
            title!,
            style: TextStyle(
                color: titlecolor,
                fontSize:  14.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height / 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              subtitle!,
              style: TextStyle(
                  color: subtitlecolor,
                  height: 1.7,
                  fontSize:  10.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
