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
    this.onPressedPrice,
    this.onPressedCard,
  });

  final String image;
  final String name;
  final String descriotions;
  final String price;
  final Function()? onPressedPrice;
  final Function()? onPressedCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedCard,
      child: Container(
        width: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Flexible(
              child: Text(
                descriotions,
                style: TextStyles.buttonStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            onPressedPrice != null
                ? ScButton(
                    onPressed: onPressedPrice,
                    label: price,
                  )
                : Offstage(),
          ],
        ),
      ),
    );
  }
}
