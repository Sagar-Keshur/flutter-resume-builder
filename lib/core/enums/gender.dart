import 'package:collection/collection.dart';

enum Gender {
  male,
  female;

  static Gender? fromString(String name) {
    return values.firstWhereOrNull((e) => e.name == name);
  }
}
