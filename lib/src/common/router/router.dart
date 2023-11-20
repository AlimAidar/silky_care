import 'package:flutter/material.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/auth/auth_screen.dart';
import 'package:silky_care/src/screens/banner/banner_screen.dart';
import 'package:silky_care/src/screens/basket/basket_screen.dart';
import 'package:silky_care/src/screens/blog_detail/blog_detail_screen.dart';
import 'package:silky_care/src/screens/calendar/calendar_screen.dart';
import 'package:silky_care/src/screens/category_detail/category_detail_screen.dart';
import 'package:silky_care/src/screens/daily_log/daily_log_screen.dart';
import 'package:silky_care/src/screens/daily_log_calendar/daily_log_calendar.dart';
import 'package:silky_care/src/screens/doctor/doctor_screen.dart';
import 'package:silky_care/src/screens/doctor_detail/doctor_detail_screen.dart';
import 'package:silky_care/src/screens/edit_password/edit_password_screen.dart';
import 'package:silky_care/src/screens/favorites/favorites_screen.dart';
import 'package:silky_care/src/screens/main/main_screen.dart';
import 'package:silky_care/src/screens/notifications/notifications_screen.dart';
import 'package:silky_care/src/screens/payment/payment_screen.dart';
import 'package:silky_care/src/screens/personal_information/personal_information_screen.dart';
import 'package:silky_care/src/screens/posts/posts_screen.dart';
import 'package:silky_care/src/screens/register/register_screen.dart';
import 'package:silky_care/src/screens/advertising/advertising_banner.dart';
import 'package:silky_care/src/screens/restore_password/restore_password.dart';
import 'package:silky_care/src/screens/settings/settings_screen.dart';
import 'package:silky_care/src/screens/support_chat/support_chat.dart';

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
      case RoutingConst.categoryDetail:
        return MaterialPageRoute(
          builder: (context) {
            return CategoryDetailScreen();
          },
        );
      case RoutingConst.basket:
        return MaterialPageRoute(
          builder: (context) {
            return BasketScreen(
              isMain: false,
            );
          },
        );
      case RoutingConst.favorite:
        return MaterialPageRoute(
          builder: (context) {
            return FavoriteScreen();
          },
        );
      case RoutingConst.payment:
        return MaterialPageRoute(
          builder: (context) {
            return PaymentScreen();
          },
        );
      case RoutingConst.blogDetail:
        return MaterialPageRoute(
          builder: (context) {
            return BlogDetailScreen();
          },
        );
      case RoutingConst.doctor:
        return MaterialPageRoute(
          builder: (context) {
            return DoctorScreen();
          },
        );
      case RoutingConst.doctorDetail:
        return MaterialPageRoute(
          builder: (context) {
            return DoctorDetailScreen();
          },
        );
      case RoutingConst.calendar:
        return MaterialPageRoute(
          builder: (context) {
            return CalendarScreen();
          },
        );
      case RoutingConst.posts:
        return MaterialPageRoute(
          builder: (context) {
            return PostsScreen();
          },
        );
      case RoutingConst.dailyLog:
        return MaterialPageRoute(
          builder: (context) {
            return DailyLogScreen();
          },
        );
      case RoutingConst.dailyLogCalendar:
        return MaterialPageRoute(
          builder: (context) {
            return DailyLogCalendar();
          },
        );
      case RoutingConst.supportChat:
        return MaterialPageRoute(
          builder: (context) {
            return SupportChatScreen();
          },
        );
      case RoutingConst.settings:
        return MaterialPageRoute(
          builder: (context) {
            return SettingsScreen();
          },
        );
      case RoutingConst.personalInformation:
        return MaterialPageRoute(
          builder: (context) {
            return PersonalInformationScreen();
          },
        );
      case RoutingConst.notification:
        return MaterialPageRoute(
          builder: (context) {
            return NotificationsScreen();
          },
        );
      case RoutingConst.editPassword:
        return MaterialPageRoute(
          builder: (context) {
            return EditPasswordScreen();
          },
        );
    }
    return null;
  }
}
