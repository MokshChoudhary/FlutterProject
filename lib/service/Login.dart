import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:studenthub/dataContainer/ErrorHandler.dart';
import 'package:studenthub/database/StudentData.dart';
import 'package:studenthub/service/ServersAPI.dart';
import 'package:studenthub/constant/server.dart';

import '../utils/Securty.dart';

class Login {
  Future<Object?> getUser(String userName, String password) async {
    Map<String, String> param = {};
    param["student_id"] = userName;
    param["password"] = password;

    var body = const JsonEncoder().convert(param);
    Object? dataToReturn;
    var header = <String, String>{};
    header["Accept"] = "*/*";
    await ServerAPI.POST_STRING(AppServer.toUri(AppServer.student_login),
            header: header, body: body)
        .then((value) {
      if (value != Null) {
        switch ((value as http.Response).statusCode) {
          case HttpStatus.ok:
            log("[/student_login] response : ${value.body} & status Code : ${value.statusCode}");
            dataToReturn = StudentData.fromJSON(
                json.decode(Securty().dencrypt(value.body)));
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
