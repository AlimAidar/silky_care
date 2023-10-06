import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class RestorePasswordStep1 extends StatelessWidget {
  const RestorePasswordStep1({
    super.key,
    required this.nextStep,
    required this.back,
    required this.controller,
  });

  final Function() nextStep;
  final Function() back;
  final TextEditingController controller;
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
            'Забыл пароль',
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
            controller: controller,
            placeholder: '',
            lableText: 'Телефон',
          ),
          Spacer(),
          ScButton(
            onPressed: nextStep,
            label: 'Отправить код',
          ),
          ScButton.text(
            onPressed: back,
            label: 'Назад',
          ),
        ],
      ),
    );
  }
}
