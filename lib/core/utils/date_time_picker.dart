import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/extensions/build_context_ex.dart';

class DateTimePicker {
  const DateTimePicker._();

  static Future<DateTime?> pickDateTime(
    BuildContext context, {
    DateTime? initialDate,
  }) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      helpText: 'SELECT DATE',
      builder: (context, child) {
        return Theme(
          data: context.theme,
          child: child!,
        );
      },
    );
  }
}
