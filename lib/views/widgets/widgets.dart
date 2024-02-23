import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resume_builder/core/extensions/build_context_ex.dart';

part 'primary_text_field.dart';

typedef WidgetDelegateBuilder = Widget Function();

Widget widgetDelegate({
  bool shouldShowPrimary = true,
  required WidgetDelegateBuilder primaryWidget,
  required WidgetDelegateBuilder alternateWidget,
}) {
  return shouldShowPrimary ? primaryWidget() : alternateWidget();
}
