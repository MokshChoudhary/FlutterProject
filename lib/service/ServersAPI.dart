// ignore_for_file: file_names

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:studenthub/constant/server.dart';

class ServerAPI {
  static Future<Object> ping() async {
    try {
      return await http.get(Uri.parse(AppServer.url));
    } catch (e) {
      log(e.toString());
      return Null;
    }
  }

  static Future<Object> GET(var url, {Map<String, String>? header}) async {
    try {
      return await http.get(url, headers: header);
    } catch (e) {
      return Null;
    }
  }

  static Future<Object> POST(String url, Map<String, String>? Param,
      {Map<String, String>? header}) async{
        
      }
}
