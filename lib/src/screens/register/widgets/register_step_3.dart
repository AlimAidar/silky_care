import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/br_check_box.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class RegisterStep3 extends StatefulWidget {
  RegisterStep3({
    super.key,
    required this.controllerName,
    required this.controllerOld,
    required this.password,
    required this.nextStep,
    required this.gender,
    required this.selectedIndex,
  });

  final TextEditingController controllerName;
  final TextEditingController controllerOld;
  final Function() password;
  final Function() nextStep;
  final Widget gender;
  final bool selectedIndex;

  @override
  State<RegisterStep3> createState() => _RegisterStep3State();
}

class _RegisterStep3State extends State<RegisterStep3> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            'Как вас зовут?',
            style: TextStyles.body,
          ),
          ScTextField(
            controller: widget.controllerName,
            placeholder: '',
            lableText: 'ФИО',
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Какой ваш пол?',
            style: TextStyles.body1,
          ),
          SizedBox(
            height: 14,
          ),
          widget.gender,
          widget.selectedIndex
              ? SizedBox(
                  height: 15,
                )
              : Offstage(),
          widget.selectedIndex
              ? ScCheckBox(
                
                  onChanged: (value) {
                    setState(() {
                      isCheck = value;
                    });
                    if (value == false) {
                      setState(() {
                        isCheck = false;
                      });
                    }
                  },
                  title: 'Включить менструальный цикл',
                  
                )
              : Offstage(),
          isCheck
              ? SizedBox(
                  height: 12,
                )
              : Offstage(),
          isCheck
              ? Row(
                  children: [
                    Expanded(     
                      child: ScTextField(lableText: 'Начало'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ScTextField(lableText: 'Конец'),
                    ),
                  ],
                )
              : Offstage(),
          SizedBox(
            height: 24,
          ),
          Text(
            'Сколько вам лет?',
            style: TextStyles.body1,
          ),
          ScTextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputType: TextInputType.numberWithOptions(),
            controller: widget.controllerOld,
            placeholder: '',
            lableText: 'Введите',
          ),
          SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 12,
          ),
          Spacer(),
          ScButton(
            onPressed: widget.nextStep,
            label: 'Продолжить',
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
