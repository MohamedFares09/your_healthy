import 'package:flutter/material.dart';
import 'package:your_health/core/widgets/custom_dailog_widget.dart';


class DatePickerHelper {
  static Future<void> pickDate({
    required BuildContext context,
    required void Function(DateTime date) onDateSelected,
  }) async {
    DateTime now = DateTime.now();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );

    if (selectedDate == null) {
      return; // المستخدم لغى الاختيار
    } else if (selectedDate.isBefore(
        DateTime(now.year, now.month, now.day))) {
      // تحقق أن اليوم المحدد سابق
      CustomDialogWidget.show(
        context: context,
        message: 'لا يمكن اختيار يوم سابق',
      );
    } else {
      // يوم صحيح
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم اختيار اليوم بنجاح")),
      );

      onDateSelected(selectedDate);
    }
  }
}
