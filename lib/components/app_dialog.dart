import 'package:flutter/material.dart';
import 'button/app_elevated_button.dart';

class AppDialog {
  AppDialog._();

  static void dialog(
    BuildContext context, {
    required String title,
    required String content,
    Function()? action,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                  style: const TextStyle(color: Colors.brown, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppElevatedButton.smallOutline(
                  onPressed: () {
                    action?.call();
                    Navigator.pop(context);
                  },
                  text: 'Yes',
                ),
                const SizedBox(width: 12.0),
                AppElevatedButton.smallOutline(
                  onPressed: () => Navigator.pop(context),
                  text: 'No',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
