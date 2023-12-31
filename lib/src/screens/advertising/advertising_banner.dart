import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/screens/advertising/widgets/card_widget.dart';

class AdvertisingScreen extends StatelessWidget {
  const AdvertisingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Image.asset(
                    'assets/logo/silky_logo.png',
                  ),
                ),
              ),
              Text(
                'Мы создваем репорт о вашей коже',
                style: TextStyles.body1,
              ),
              SizedBox(
                height: 27,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey2,
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Кожа такая та и такая, кожа сухая и нужен постоянный уход за кожей так как обычные средства не помогают ',
                  style: TextStyles.buttonStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Рекомендуем вам попробовать эти продукты',
                style: TextStyles.buttonStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 4,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return CardWidget(
                      onPressedPrice: () {},
                      image: 'assets/image/photo3.png',
                      name: 'acaasdadasdasdadsadasdasdasdcasc',
                      descriotions: 'ascwadawdaefsweefwefwefewfasc',
                      price: '1500 тг',
                    );
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ScButton(
                onPressed: () {},
                label: 'Закончить',
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
