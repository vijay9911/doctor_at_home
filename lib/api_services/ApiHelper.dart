// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:base_project_flutter/Constants/apiConstants.dart';
import 'package:base_project_flutter/globalFuctions/globalFunctions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  //All Post type request will handle here
  getTypePost(
      BuildContext context, String uri, Map<String, String> params) async {
    String jsonResponse;
    var url = apiBaseUrl + uri;
    print(url);
    print("params>>>>>"+params.toString());

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(params);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var value = await response.stream.bytesToString();
       
        jsonResponse = value.toString();

        var jsonMap = json.decode(jsonResponse);
        // print(jsonMap);

        return jsonMap;
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

  //All Get type request will handle here
  getTypeGet(BuildContext context, String uri) async {
    var client = http.Client();
    var jsonMap;
    try {
      var response = await client.get(Uri.parse(apiBaseUrl + uri));
      print(apiBaseUrl + uri);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        jsonMap = json.decode(jsonString);

        return jsonMap;
      } else {
        Twl.errorHandler(context, response.statusCode);
      }
    } on SocketException {
      print("error");
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check Internet'),
      ));
    } catch (Exception) {
      return jsonMap;
    }
  }
}
