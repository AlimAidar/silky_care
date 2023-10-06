import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

bool isOpen = true;

final passwordController = TextEditingController();
final emailController = TextEditingController();
final GlobalKey _formKey = GlobalKey();
bool tap = true;
final Box userBox = Hive.box('user');
final Box tokenBox = Hive.box('tokens');

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
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
                const Text(
                  'Войти ',
                  style: TextStyles.head,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Введите телефон и пароль для входа в ваш личный кабинет',
                  style: TextStyles.body,
                ),
                const SizedBox(
                  height: 15,
                ),
                ScTextField(
                  controller: emailController,
                  placeholder: 'Укажите свой логин',
                  lableText: 'login',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  validator: (email) {
                    if (email == null || email.trim().isEmpty) {
                      return 'Поле должно быть заполнено';
                    } else {
                      //   bool isValid = RegExp(
                      //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      //     r"{0,253}[a-zA-Z0-9])?)*$",
                      //   ).hasMatch(
                      //     email.trim(),
                      //   );
                      //   return isValid
                      //       ? null
                      //       : 'Введённая почта некоректна';
                      // }
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 23,
                ),
                ScTextField(
                  validator: (password) {
                    if (password == null || password.trim().isEmpty) {
                      return 'Поле должно быть заполнено';
                    } else {
                      // bool isValid = password.trim().length >= 8;
                      // return isValid ? null : 'Пароль слишком короткий';
                    }
                    return null;
                  },
                  controller: passwordController,
                  placeholder: 'Пароль',
                  lableText: 'password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: isOpen
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  iconPressed: () {
                    setState(
                      () {
                        isOpen = !isOpen;
                      },
                    );
                  },
                  obscureText: isOpen,
                ),
                const SizedBox(
                  height: 40,
                ),
                ScButton.text(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutingConst.restorePassword,
                    );
                  },
                  label: 'Забыл пароль? ',
                ),
                const SizedBox(
                  height: 23,
                ),
                ScButton(
                  label: 'Войти',
                  onPressed: () {
                    Navigator.pushNamed(context, RoutingConst.main);
                    FormState? formState = _formKey.currentState as FormState;
                    if (formState.validate()) {}
                  },
                  textColor: AppColors.white,
                ),
                ScButton.text(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: 'Назад',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
