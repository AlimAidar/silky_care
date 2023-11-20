import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class SettingContainerWidget extends StatelessWidget {
  const SettingContainerWidget(
      {Key? key, required this.count, required this.title})
      : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выполнено',
                style: TextStyles.body,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyles.body1.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Text('$countраз')
        ],
      ),
    );
  }
}
