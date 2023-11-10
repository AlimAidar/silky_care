import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({
    Key? key,
    required this.isSelected,
    required this.week,
  }) : super(key: key);

  final bool isSelected;
  final String week;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          week,
          style: TextStyles.head,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(360),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.grey3,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: Icon(
                  Icons.water_drop_outlined,
                  size: isSelected ? 20 : 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isSelected ? 15 : 10,
                    height: isSelected ? 15 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: AppColors.purple,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: isSelected ? 15 : 10,
                    height: isSelected ? 15 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
