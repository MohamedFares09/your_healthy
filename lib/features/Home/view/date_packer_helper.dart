import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    } else if (selectedDate.isBefore(DateTime(now.year, now.month, now.day))) {
      CustomDialogWidget.show(
        context: context,
        message: 'لا يمكن اختيار يوم سابق',
      );
    } else {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم اختيار اليوم: $formattedDate")),
      );

      onDateSelected(selectedDate); // يمكنك تمرير formattedDate لو عدلت نوع المتغير
    }
  }
}
