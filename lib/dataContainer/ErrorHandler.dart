// ignore_for_file: file_names

class ErrorHandler {
  final int errorCode;
  final String msg;
  final String status;

  static ErrorHandler fromJSON(Map<String, dynamic> json) =>
      ErrorHandler(json["errorCode"], json["msg"], json["status"]);

  ErrorHandler(this.errorCode, this.msg, this.status);
}
