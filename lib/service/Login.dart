import 'dart:developer';

import 'package:studenthub/database/Student.dart';
import 'package:studenthub/service/ServersAPI.dart';
import 'package:studenthub/constant/server.dart';

class Login {
  Student? getUser(String userName, String password) {
    Map<String, String> param = new Map();
    param["student_id"] = userName;
    param["password"] = password;

    ServerAPI.POST(AppServer.url + AppServer.student_login, param: param)
        .then((value) => {})
        .onError((error, stackTrace) => {});

    return null;
  }
}
