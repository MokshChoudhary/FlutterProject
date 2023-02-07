// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart' as http;
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

  static Future<Object> GET(String url, {Map<String, String>? header}) async {
    try {
      return await http.get(Uri(scheme: url), headers: header);
    } catch (e) {
      return Null;
    }
  }

  static Future<Object> POST(String url,
      {Map<String, String>? param,
      required Map<String, String>? header}) async {
    return await http.post(Uri(scheme: url), headers: header, body: param);
  }
}
