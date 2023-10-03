import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:silky_care/src/common/dependecies/injection_container.dart';
import 'package:silky_care/src/common/dependecies/sc_hive.dart';
import 'package:silky_care/src/common/router/router.dart';
import 'package:silky_care/src/common/router/routing_const.dart';

void main() async {
  await initHive();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

String route = RoutingConst.banner;
Box tokensBox = Hive.box('tokens');
String? access = tokensBox.get('access');

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // if (access == null) {
    //   route = RoutingConst.banner;
    // }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: route,
      onGenerateRoute: MetaRouter.onGenerateRoute,
    );
  }
}
