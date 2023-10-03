import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/br_check_box.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({
    super.key,
    required this.controller,
    required this.password,
    required this.nextStep,
    required this.backStep,
  });

  final TextEditingController controller;
  final Function() password;
  final Function() nextStep;
  final Function() backStep;

  @override
  State<RegisterStep1> createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Text(
            'Добро пожаловать в SkinCare!',
            style: TextStyles.head,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Введите номер чтобы продолжить',
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
            lableText: 'Телефон',
          ),
          SizedBox(
            height: 12,
          ),
          ScCheckBox(
            onChanged: (value) {
              setState(() {
                isCheck = value;
              });
            },
            title:
                'Я принимаю условия лицензионного соглашения и политики данных ',
          ),
          SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: widget.password,
            child: Text(
              'Забыл пароль?',
              style: TextStyles.body.copyWith(fontSize: 15),
            ),
          ),
          Spacer(),
          ScButton(
            onPressed: isCheck ? widget.nextStep : null,
            label: 'Продолжить',
          ),
          SizedBox(
            height: 6,
          ),
          ScButton.text(
            onPressed: () {},
            label: 'Назад',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
