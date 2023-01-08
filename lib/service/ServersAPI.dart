// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:studenthub/constant/server.dart';

class ServerAPI {
  static Future<http.Response> ping() async {
    return await http.get(Uri.parse(AppServer.url));
  }
}
