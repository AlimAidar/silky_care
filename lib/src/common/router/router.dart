import 'package:flutter/material.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/auth/auth_screen.dart';
import 'package:silky_care/src/screens/banner/banner_screen.dart';
import 'package:silky_care/src/screens/main/main_screen.dart';
import 'package:silky_care/src/screens/register/register_screen.dart';
import 'package:silky_care/src/screens/advertising/advertising_banner.dart';
import 'package:silky_care/src/screens/restore_password/restore_password.dart';

class MetaRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutingConst.banner:
        return MaterialPageRoute(
          builder: (context) {
            return BannerScreen();
          },
        );
      case RoutingConst.auth:
        return MaterialPageRoute(
          builder: (context) {
            return AuthScreen();
          },
        );
      case RoutingConst.restorePassword:
        return MaterialPageRoute(
          builder: (context) {
            return RestorePasswordScreen();
          },
        );
      case RoutingConst.register:
        return MaterialPageRoute(
          builder: (context) {
            return RegisterScreen();
          },
        );
      case RoutingConst.advertising:
        return MaterialPageRoute(
          builder: (context) {
            return AdvertisingScreen();
          },
        );
      case RoutingConst.main:
        return MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        );
    }
    return null;
  }
}
