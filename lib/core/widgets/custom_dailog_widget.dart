import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogWidget {
  static Future<void> show({
    required BuildContext context,
    required String message,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Row(
              children: const [
                Icon(Icons.warning, color: Colors.red),
                SizedBox(width: 8),
                Text("تنبيه"),
              ],
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("موافق"),
              ),
            ],
          ),
        );
      },
    );
  }
}
