import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _shared;

  static final Preferences _instance = Preferences();
  static Preferences get instance => _instance;

  ///string messages
  final String _uid = 'uid';

  ///init
  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  String get uid => _shared?.getString(_uid) ?? nullValue;

  set uid(String value) => _shared?.setString(_uid, value);

  Future<void> clear() async {
    await _shared?.clear();
  }
}
