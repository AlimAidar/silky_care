import 'dart:async';

import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class EditPasswordScreen extends StatefulWidget {
  EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  static const _timerDuration = 30;
  StreamController _timerStream = new StreamController<int>();
  int? timerCounter;
  Timer? _resendCodeTimer;
  final PageController pageViewController = PageController();

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
        appBar: AppBar(
          title: Text(
            'Уведомление',
            style: TextStyles.head1,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageViewController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Новый пароль',
                    style: TextStyles.head,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Мы отправили сообщение с новым паролем, если сообщение не пришло отправьте заново после 30 секунд',
                    style: TextStyles.body,
                  ),
                  SizedBox(
                    height: 20, 
                  ),
                  ScTextField(lableText: 'Новый пароль'),
                  SizedBox(
                    height: 20,
                  ),
                  ScButton(
                    onPressed: () {
                      pageViewController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    label: 'Отправить',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Новый пароль',
                    style: TextStyles.head,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Мы отправили сообщение с новым паролем, если сообщение не пришло отправьте заново после 30 секунд',
                    style: TextStyles.body,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ScTextField(lableText: 'Новый пароль'),
                  SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
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
                  SizedBox(
                    height: 20,
                  ),
                  ScButton(
                    onPressed: () {},
                    label: 'Подтвердить',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
