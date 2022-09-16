// ignore_for_file: must_be_immutable

import 'package:base_project_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants/imageConstant.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  List<String> items = [
    Images.GIMAGE1,
    Images.GIMAGE2,
    Images.GIMAGE3,
    Images.GIMAGE4,
    Images.GIMAGE5,
    Images.GIMAGE6,
    Images.GIMAGE7,
    Images.GIMAGE8,
    Images.GIMAGE9,
    Images.GIMAGE10,
    Images.GIMAGE11,
    Images.GIMAGE12,
    Images.GIMAGE13,
    Images.GIMAGE14,
    Images.GIMAGE15,
    Images.GIMAGE16,
    Images.GIMAGE17,
    Images.GIMAGE18,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        foregroundColor: tPrimaryColor,
        backgroundColor: tWhite,
        elevation: 1.0,
      ),
      body: Container(
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Image.asset(
              items[index],
            );
          },
        ),
      ),
    );
  }
}
