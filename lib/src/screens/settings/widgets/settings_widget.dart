import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description, required this.onPressed})
      : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.buttonStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: TextStyles.body.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
