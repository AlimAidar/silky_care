import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutingConst.supportChat,
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/support.svg',
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 28),
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.grey3,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ScTextField(
                    lableText: 'ФИО',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ScTextField(
                    lableText: 'Данные карты',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ScTextField(
                    lableText: 'CVV',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ScTextField(
                    lableText: 'Год окончания срока карты ',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ScTextField(
                    lableText: 'Месяц окончания срока карты',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ScButton(
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
