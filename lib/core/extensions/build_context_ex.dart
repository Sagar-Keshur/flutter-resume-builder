import 'dart:io';

import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  bool get isMobileApp => Platform.isAndroid || Platform.isIOS;
}
