import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/settings/widgets/setting_container_widget.dart';
import 'package:silky_care/src/screens/settings/widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {
        'icon': 'assets/icons/ThumbsUp.svg',
        'title': 'Мои продукты',
        'description': '',
        'onPressed': () {},
      },
      {
        'icon': 'assets/icons/User.svg',
        'title': 'Личная информация',
        'description': 'Телефон, пароль...',
        'onPressed': () {
          Navigator.pushNamed(
            context,
            RoutingConst.personalInformation,
          );
        },
      },
      {
        'icon': 'assets/icons/Bell.svg',
        'title': 'Уведомление',
        'description': 'Дневные, месячные...',
        'onPressed': () {
          Navigator.pushNamed(
            context,
            RoutingConst.notification,
          );
        },
      },
      {
        'icon': 'assets/icons/Lock.svg',
        'title': 'Пароль',
        'description': 'Изменить пароль',
        'onPressed': () {
          Navigator.pushNamed(
            context,
            RoutingConst.editPassword,
          );
        },
      },
    ];
    List<Map> items2 = [
      {
        'icon': 'assets/icons/User.svg',
        'title': 'Мои продукты',
        'description': '',
        'onPressed': () {},
      },
      {
        'icon': 'assets/icons/Lightning-Alt.svg',
        'title': 'Пароль',
        'description': 'Изменить пароль',
        'onPressed': () {},
      },
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Имя пользователя',
                style: TextStyles.head1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Версия приложения : 1.4',
                style: TextStyles.body,
              ),
            ],
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
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 15,
              ),
              SettingContainerWidget(
                count: '20',
                title: 'Дневной уход:',
              ),
              SizedBox(
                height: 12,
              ),
              SettingContainerWidget(
                count: '36',
                title: 'Вечерний уход:',
              ),
              SizedBox(
                height: 12,
              ),
              SettingContainerWidget(
                count: '15',
                title: 'Селфи:',
              ),
              SizedBox(
                height: 33,
              ),
              Text(
                'Настройки',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SettingsWidget(
                    icon: items[index]['icon'],
                    title: items[index]['title'],
                    description: items[index]['description'],
                    onPressed: items[index]['onPressed'],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemCount: items.length,
              ),
              SizedBox(
                height: 55,
              ),
              Text(
                'О твоей коже',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SettingsWidget(
                    icon: items2[index]['icon'],
                    title: items2[index]['title'],
                    description: items2[index]['description'],
                    onPressed: items2[index]['onPressed'],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemCount: items2.length,
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
