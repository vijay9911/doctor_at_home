import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hinttext,
    this.controllers,
    this.validators,
  }) : super(key: key);
  final hinttext;
  final controllers;
  final validators;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [tBoxShadow]),
      height:55,
      child: TextFormField(
        controller: controllers,
        validator: validators,
        decoration: InputDecoration(
          fillColor: tWhite,
          filled: true,
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(tDefaultPadding / 2),
          ),
        ),
      ),
    );
  }
}
