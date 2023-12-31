// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:studenthub/constant/server.dart';

class ServerAPI {
  void serverLog(String url, String type, {Object? header, Object? body}) {
    log("########################$type#####################");
    log("URL : $url");
    log("Header : $header");
    log("Body : $body");
    log("##################################################");
  }

  Future<Object> ping() async {
    try {
      serverLog(AppServer.url + AppServer.version, "Request",
          header: {"version": 1.0});
      return await http.post(Uri.parse(AppServer.url + AppServer.version),
          headers: {"version": "1.0"});
    } catch (e) {
      log(e.toString());
      return Null;
    }
  }

  Future<Object> GET(String url, {Map<String, String>? header}) async {
    try {
      serverLog(url, "Request", header: header);
      return await http.get(Uri(scheme: url), headers: header);
    } catch (e) {
      return Null;
    }
  }

  Future<Object> GET_STRING(String url, {Map<String, String>? header}) async {
    try {
      serverLog(url, "Request", header: header);
      return await http.get(Uri(scheme: url), headers: header);
    } catch (e) {
      return Null;
    }
  }

  Future<Object> POST(Uri url,
      {required Map<String, Object>? body, Map<String, String>? header}) async {
    serverLog(url.toString(), "Request", header: header, body: body);
    return await http.post(url, headers: header, body: body);
  }

  Future<Object> POST_STRING(Uri url,
      {required String? body, Map<String, String>? header}) async {
    serverLog(url.toString(), "Request", header: header, body: body);
    return await http.post(url, headers: header, body: body);
  }
}
