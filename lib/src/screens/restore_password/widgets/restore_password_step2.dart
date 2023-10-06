import 'dart:async';

import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class RestorePasswordStep2 extends StatefulWidget {
  const RestorePasswordStep2({
    super.key,
    required this.nextStep,
    required this.back,
    required this.controller,
  });
  final Function() nextStep;
  final Function() back;
  final TextEditingController controller;

  @override
  State<RestorePasswordStep2> createState() => _RestorePasswordStep2State();
}

class _RestorePasswordStep2State extends State<RestorePasswordStep2> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: Image.asset('assets/logo/silky_logo.png'),
            ),
          ),
          Text(
            'Введите SMS',
            style: TextStyles.head,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Мы отправили сообщение с новым паролем, если сообщение не пришло отправьте заново после 30 секунд',
            style: TextStyles.body1,
          ),
          SizedBox(
            height: 20,
          ),
          ScTextField(
            controller: widget.controller,
            placeholder: '',
            lableText: 'Телефон',
          ),
          StreamBuilder(
            stream: _timerStream.stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              return SizedBox(
                  width: 300,
                  height: 30,
                  child: TextButton(
                    // textColor: Theme.of(context).canvasColor,

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
                  ));
            },
          ),
          Spacer(),
          ScButton(
            onPressed: widget.nextStep,
            label: 'Войти',
          ),
          ScButton.text(
            onPressed: widget.back,
            label: 'Назад',
          ),
        ],
      ),
    );
  }
}
