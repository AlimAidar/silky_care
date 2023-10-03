import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';

class RegisterStep4 extends StatelessWidget {
  const RegisterStep4({
    super.key,
    required this.nextStep,
    required this.test,
  });

  final Function() nextStep;
  final Widget test;

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
            'Как бы вы описали вашу кожу?',
            style: TextStyles.head,
          ),
          SizedBox(
            height: 12,
          ),
          test,
          Spacer(),
          ScButton(
            onPressed: nextStep,
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
