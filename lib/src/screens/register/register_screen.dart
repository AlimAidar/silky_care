import 'dart:async';

import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/register/widgets/register_step_2.dart';
import 'package:silky_care/src/screens/register/widgets/register_step_1.dart';
import 'package:silky_care/src/screens/register/widgets/register_step_3.dart';
import 'package:silky_care/src/screens/register/widgets/register_step_4.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController pageViewController = PageController();
  List<String> images = [
    'assets/image/men.png',
    'assets/image/women.png',
  ];
  int selectedIndex = 0;
  static const _timerDuration = 30;
  StreamController _timerStream = new StreamController<int>();
  int? timerCounter;
  Timer? _resendCodeTimer;

  activeCounter() {
    _resendCodeTimer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timerDuration - timer.tick > 0)
        _timerStream.sink.add(_timerDuration - timer.tick);
      else {
        _timerStream.sink.add(0);
        _resendCodeTimer!.cancel();
      }
    });
  }

  @override
  void initState() {
    activeCounter();

    super.initState();
  }

  @override
  dispose() {
    _timerStream.close();
    _resendCodeTimer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageViewController,
          children: [
            RegisterStep1(
              controller: TextEditingController(),
              password: () {},
              nextStep: () {
                pageViewController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              backStep: () {
                Navigator.pop(context);
              },
            ),
            RegisterStep2(
              timer: StreamBuilder(
                stream: _timerStream.stream,
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  return SizedBox(
                    width: 300,
                    height: 30,
                    child: TextButton(
                      child: snapshot.data == 0
                          ? Text(
                              'send code again',
                              style: TextStyles.body,
                            )
                          : Text(
                              ' button will be enable after ${snapshot.hasData ? snapshot.data.toString() : 30} seconds ',
                              style: TextStyles.body,
                            ),
                      onPressed: snapshot.data == 0
                          ? () {
                              // your sending code method

                              _timerStream.sink.add(30);
                              activeCounter();
                            }
                          : null,
                    ),
                  );
                },
              ),
              controller: TextEditingController(),
              password: () {},
              nextStep: () {
                pageViewController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              backStep: () {
                pageViewController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
            RegisterStep3(
              controllerName: TextEditingController(),
              controllerOld: TextEditingController(),
              selectedIndex: selectedIndex == 1,
              password: () {},
              nextStep: () {
                pageViewController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              gender: Expanded(
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColors.grey2,
                          border: selectedIndex == index
                              ? Border.all(color: AppColors.purple, width: 5)
                              : null,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 6,
                    );
                  },
                  itemCount: images.length,
                ),
              ),
            ),
            RegisterStep4(
              nextStep: () {
                Navigator.pushNamed(
                  context,
                  RoutingConst.advertising,
                );
              },
              test: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Моя кожа сухая и нужен постоянный уход за кожей так как обычные средства не помогают',
                  style: TextStyles.body1.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
