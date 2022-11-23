import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';

class AppDialog {
  String msg = "";
  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColor,
          icon: const Text(AppString.appName),
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('This is a demo alert dialog.'),
                msg == ""
                    ? const Text('Would you like to approve of this message?')
                    : Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
