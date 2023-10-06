import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({
    super.key,
    required this.controller,
    required this.password,
    required this.nextStep,
    required this.backStep,
    required this.timer,
  });
  final TextEditingController controller;
  final Function() password;
  final Function() nextStep;
  final Function() backStep;
  final Widget timer;

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Text(
            'Регистрация',
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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputType: TextInputType.numberWithOptions(),
            controller: widget.controller,
            placeholder: '',
            lableText: 'Пароль из смс',
          ),
          SizedBox(
            height: 12,
          ),
          widget.timer,
          Spacer(),
          ScButton(
            onPressed: widget.nextStep,
            label: 'Продолжить',
          ),
          SizedBox(
            height: 6,
          ),
          ScButton.text(
            onPressed: widget.backStep,
            label: 'Назад',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
