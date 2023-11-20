import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class PersonalInformationScreen extends StatefulWidget {
  PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Личная информация',
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              ScTextField(
                prefixIcon: Icon(Icons.person),
                lableText: 'Пол',
              ),
              SizedBox(
                height: 16,
              ),
              ScTextField(
                prefixIcon: Icon(Icons.person),
                lableText: 'Возраст',
              ),
              SizedBox(
                height: 16,
              ),
              ScTextField(
                prefixIcon: Icon(Icons.numbers),
                lableText: 'Номер телефона',
              ),
              SizedBox(
                height: 16,
              ),
              ScTextField(
                prefixIcon: Icon(Icons.mail),
                lableText: 'Gmail',
              ),
              SizedBox(
                height: 24,
              ),
              ScButton(
                onPressed: () {},
                label: 'Сохранить',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
