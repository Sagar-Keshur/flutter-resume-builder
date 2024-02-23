import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/utils/preferences.dart';

final Preferences preferences = Preferences.instance;

TextScaler get defaultTextScaler => TextScaler.noScaling;

String get productName => 'Resume builder';

double get defaultPaddingValue => 16;

double get defaultRadiusValue => 12;

double get defaultLetterSpacing => 0.8;

GlobalKey<NavigatorState> defaultNavigatorKey = GlobalKey<NavigatorState>();

String get nullValue => 'N/A';
