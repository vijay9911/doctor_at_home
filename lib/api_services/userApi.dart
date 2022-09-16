// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:base_project_flutter/Constants/apiConstants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserAPI {
  //Send OTP
  static sendOtp(BuildContext context, String username) async {
    String jsonResponse;
    var url = apiBaseUrl + SEND_OTP;
    print(url);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'contact_no': username});
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();

        var currentUser = json.decode(jsonResponse);
        print(currentUser);

        return currentUser;
      } else {
        Twl.errorHandler(context, response.statusCode);
        print(response.reasonPhrase);
      }
    } on SocketException {
      print("error");
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check Internet'),
      ));
      // Twl.createAlert(context,'dfd','dfdfd');

    }
  }

  //Verify OTP
  verifyOtp(BuildContext context, String username, String sessionId,
      String otpCode, String deviceToken, String deviceType) async {
    String jsonResponse;
    var url = apiBaseUrl + VERIFY_OTP;
    print(url);
    print(deviceToken);
    print(sessionId);
    print(otpCode);
    print(username);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'contact_no': username,
      'otp_code': otpCode,
      'device_token': deviceToken,
      'device_type': deviceType,
      'session_code': sessionId
    });
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();

        jsonResponse = value.toString();
        print(jsonResponse);
        var currentUser = json.decode(jsonResponse);

        return currentUser;
      } else {
        Twl.errorHandler(context, response.statusCode);
        print(response.reasonPhrase);
      }
    } on SocketException {
      print("error");
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check Internet'),
      ));
      // Twl.createAlert(context,'dfd','dfdfd');

    }
  }

//Check API
  checkApi(BuildContext context, String authCode) async {
    var client = http.Client();
    var jsonMap;
    try {
      var response =
          await client.get(Uri.parse(apiBaseUrl + CHECK_API + authCode));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        jsonMap = json.decode(jsonString);

        //categoriesModel = Categories.fromJson(jsonMap);
        return jsonMap;
      } else {
        Twl.errorHandler(context, response.statusCode);
      }
    } on SocketException {
      print("error");
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check Internet'),
      ));
      // Twl.createAlert(context,'dfd','dfdfd');

    } catch (Exception) {
      return jsonMap;
    }
  }

  checkDelivery(BuildContext context, String s, String postalCode) {}
}
