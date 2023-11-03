import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';

class BannerScreen extends StatefulWidget {
  BannerScreen({Key? key}) : super(key: key);

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Image.asset(
                  'assets/logo/silky_logo.png',
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: PageView(
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.15),
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          'Отслеживайте состояние вашей кожи каждый день',
                          style: TextStyles.header
                              .copyWith(color: AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Получайте скидки ежемесячно и также участвуйте в акциях',
                          style:
                              TextStyles.body.copyWith(color: AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.15),
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 44),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Отслеживайте состояние вашей кожи каждый день',
                          style: TextStyles.header,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Получайте скидки ежемесячно и также участвуйте в акциях',
                          style: TextStyles.body,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.15),
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          'Отслеживайте состояние вашей кожи каждый день',
                          style: TextStyles.header,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Получайте скидки ежемесячно и также участвуйте в акциях',
                          style: TextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ScButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutingConst.register);
                },
                label: 'Зарегестрироваться',
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ScButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutingConst.auth,
                  );
                },
                label: 'Войти',
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                'или',
                style: TextStyles.body,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ScButton(
                      onPressed: () {},
                      label: 'Google',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ScButton(
                      onPressed: () {},
                      label: 'Apple ID',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37,
            ),
          ],
        ),
      ),
    );
  }
}
