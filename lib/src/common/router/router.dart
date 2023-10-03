import 'package:flutter/material.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/banner/banner_screen.dart';
import 'package:silky_care/src/screens/register/register_screen.dart';

class MetaRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutingConst.banner:
        return MaterialPageRoute(
          builder: (context) {
            return BannerScreen();
          },
        );
      case RoutingConst.register:
        return MaterialPageRoute(
          builder: (context) {
            return RegisterScreen();
          },
        );
    }
    return null;
  }
}
