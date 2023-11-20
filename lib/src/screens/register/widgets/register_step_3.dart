import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/br_check_box.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';
import 'package:silky_care/src/screens/notifications/widgets/notification_widget.dart';

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

  DateTime date = DateTime(2016, 10, 26, 8, 15);
  DateTime time = DateTime(2016, 5, 10, 22, 35);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

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
              ? Column(
                  children: [
                    DatePickerItem(
                      children: <Widget>[
                        Icon(Icons.wb_sunny_outlined),
                        const Text(
                          'Утренний уход',
                          style: TextStyles.head,
                        ),
                        CupertinoButton(
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: date,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              showDayOfWeek: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => date = newDate);
                              },
                            ),
                          ),
                          child: Text(
                            '${date.hour}:${date.minute}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DatePickerItem(
                      children: <Widget>[
                        Icon(Icons.nightlight_outlined),
                        const Text(
                          'Вечерний уход',
                          style: TextStyles.head,
                        ),
                        CupertinoButton(
                          onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: time,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newTime) {
                                setState(() => time = newTime);
                              },
                            ),
                          ),
                          child: Text(
                            '${time.hour}:${time.minute}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
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
