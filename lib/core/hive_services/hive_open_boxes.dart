import 'package:hive/hive.dart';

class OpenBoxes {
  void openBox(String boxName) async {
    Hive.openBox(boxName);
  }
}
