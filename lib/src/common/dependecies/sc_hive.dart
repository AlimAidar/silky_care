import 'package:hive_flutter/adapters.dart';


Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  await Hive.openBox('user');
  await Hive.openBox('segment_list');
  await Hive.openBox('article_list');
  await Hive.openBox('scan_mode');
}
