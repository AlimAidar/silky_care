import 'package:flutter/material.dart';
import 'package:silky_care/src/screens/restore_password/widgets/restore_password_step1.dart';
import 'package:silky_care/src/screens/restore_password/widgets/restore_password_step2.dart';

class RestorePasswordScreen extends StatefulWidget {
  RestorePasswordScreen({Key? key}) : super(key: key);

  @override
  State<RestorePasswordScreen> createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageViewController,
          children: [
            RestorePasswordStep1(
              controller: TextEditingController(),
              nextStep: () {
                pageViewController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              back: () {
                Navigator.pop(context);
              },
            ),
            RestorePasswordStep2(
              controller: TextEditingController(),
              nextStep: () {},
              back: () {
                pageViewController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
