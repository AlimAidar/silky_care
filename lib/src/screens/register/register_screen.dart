import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/br_check_box.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';
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
                        setState(() {});
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColors.purple,
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
              nextStep: () {},
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
            Column(
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
                  placeholder: '',
                  lableText: 'Телефон',
                ),
                SizedBox(
                  height: 12,
                ),
                ScCheckBox(
                  title:
                      'Я принимаю условия лицензионного соглашения и политики данных ',
                ),
                SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыл пароль?',
                    style: TextStyles.body.copyWith(fontSize: 15),
                  ),
                ),
                Spacer(),
                ScButton(
                  onPressed: () {},
                  label: 'Продолжить',
                ),
                SizedBox(
                  height: 6,
                ),
                ScButton(
                  onPressed: () {},
                  label: 'Назад',
                  color: Colors.white,
                ),
              ],
            ),
            Column(
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
                  placeholder: '',
                  lableText: 'Телефон',
                ),
                SizedBox(
                  height: 12,
                ),
                ScCheckBox(
                  title:
                      'Я принимаю условия лицензионного соглашения и политики данных ',
                ),
                SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыл пароль?',
                    style: TextStyles.body.copyWith(fontSize: 15),
                  ),
                ),
                Spacer(),
                ScButton(
                  onPressed: () {},
                  label: 'Продолжить',
                ),
                SizedBox(
                  height: 6,
                ),
                ScButton(
                  onPressed: () {},
                  label: 'Назад',
                  color: Colors.white,
                ),
              ],
            ),
            Column(
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
                  placeholder: '',
                  lableText: 'Телефон',
                ),
                SizedBox(
                  height: 12,
                ),
                ScCheckBox(
                  title:
                      'Я принимаю условия лицензионного соглашения и политики данных ',
                ),
                SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыл пароль?',
                    style: TextStyles.body.copyWith(fontSize: 15),
                  ),
                ),
                Spacer(),
                ScButton(
                  onPressed: () {},
                  label: 'Продолжить',
                ),
                SizedBox(
                  height: 6,
                ),
                ScButton(
                  onPressed: () {},
                  label: 'Назад',
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
