// ignore_for_file: constant_identifier_names

class AppServer {
  static const scheme = "http";
  static const host = "localhost";
  static const port = 8000;
  static const url = "http://localhost:8000/";
  static const version = "version";
  static const student_register = "student_register";
  static const student_login = "student_login";

  static Uri toUri(String path) {
    return Uri(scheme: scheme, host: host, port: port, path: path);
  }
}
