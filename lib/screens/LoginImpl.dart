// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:studenthub/service/ServersAPI.dart';
import 'package:studenthub/utils/Securty.dart';

import '../constant/server.dart';
import '../dataContainer/ErrorHandler.dart';
import '../database/StudentData.dart';

class LoginImpl {
  LoginImpl() {}

  Future<Object?> getStudentLogin(String userName, String password) async {
    Map<String, String> param = {};
    param["username"] = userName;
    // param["password"] = Security().encrypt(password);
    param["password"] = password;

    var body = const JsonEncoder().convert(param);
    Object? dataToReturn;
    var header = <String, String>{};
    header["Accept"] = "*/*";
    await ServerAPI()
        .POST_STRING(AppServer.toUri(AppServer.student_login),
            header: header, body: body)
        .then((value) {
      if (value != Null) {
        switch ((value as http.Response).statusCode) {
          case HttpStatus.ok:
            var data = value.body /*Security().decrypt(value.body)*/;
            log("[/student_login] response : ${value.body} & status Code : ${value.statusCode}");
            dataToReturn = StudentData.fromJSON(data as Map<String, dynamic>);
            break;
          case HttpStatus.unauthorized:
            log("[/student_login] response : ${value.body} & status Code : ${value.statusCode}");
            dataToReturn = ErrorHandler.fromJSON(json.decode(value.body));
            break;
        }
      }
    });
    return dataToReturn;
  }

  Future<Object?> getAdminLogin(String userName, String password) async {
    Map<String, String> param = {};
    param["admin_id`"] = userName;
    param["password"] = Security().encrypt(password);

    var body = const JsonEncoder().convert(param);
    Object? dataToReturn;
    var header = <String, String>{};
    header["Accept"] = "*/*";
    await ServerAPI()
        .POST_STRING(AppServer.toUri(AppServer.student_login),
            header: header, body: body)
        .then((value) {
      if (value != Null) {
        switch ((value as http.Response).statusCode) {
          case HttpStatus.ok:
            var data = value.body /*Security().decrypt(value.body)*/;
            log("[/student_login] response : ${value.body} & status Code : ${value.statusCode}");
            dataToReturn = StudentData.fromJSON(data as Map<String, dynamic>);
            break;
          case HttpStatus.unauthorized:
            log("[/student_login] response : ${value.body} & status Code : ${value.statusCode}");
            dataToReturn = ErrorHandler.fromJSON(json.decode(value.body));
            break;
        }
      }
    });
    return dataToReturn;
  }
}
