import 'package:hive_flutter/adapters.dart';

class Boxes {
  static Box<dynamic> get loginBox => Hive.box("data");
}
