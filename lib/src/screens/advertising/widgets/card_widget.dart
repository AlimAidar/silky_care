import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.descriotions,
    required this.price,
  });

  final String image;
  final String name;
  final String descriotions;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 187,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Flexible(
          child: Text(
            name,
            style: TextStyles.body,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Flexible(
          child: Text(
            descriotions,
            style: TextStyles.buttonStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ScButton(
          onPressed: null,
          label: price,
        ),
      ],
    );
  }
}
