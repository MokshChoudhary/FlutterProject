import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:studenthub/database/StudentData.dart';
import 'package:studenthub/service/ServersAPI.dart';
import 'package:studenthub/constant/server.dart';

class Login {
  Future<StudentData?> getUser(String userName, String password) async {
    Map<String, String> param = {};
    param["student_id"] = userName;
    param["password"] = password;

    var body = const JsonEncoder().convert(param);

    StudentData? student;
    var header = <String, String>{};
    header["Accept"] = "*/*";
    await ServerAPI.POST_STRING(AppServer.toUri(AppServer.student_login),
            header: header, body: body)
        .then((value) {
      log("[/student_login] response : ${(value as http.Response).body}");
      var encodedString = jsonEncode(value.body);

      student = StudentData.fromJSON(json.decode(encodedString));
    }).onError((error, stackTrace) {
      log("[/student_login] response : $error, $stackTrace");
    });
    return student;
  }
}
