// ignore_for_file: constant_identifier_names

class AppServer {
  static const scheme = "http";
  static const host = "127.0.0.1";
  static const port = 8000;
  static const version = "get/versionCheck";
  static const student_register = "student_register";
  static const student_login = "login/student";
  static const class_meta_data = "student_login";

  static Uri toUri(String path) {
    return Uri(scheme: scheme, host: host, port: port, path: path);
  }
}
