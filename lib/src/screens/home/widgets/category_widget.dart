import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
    required this.selectedIndex,
    required this.onPressed,
  }) : super(key: key);
  final String category;
  final Function() onPressed;
  final bool selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.grey2,
          border: Border.all(
              color: selectedIndex ? Colors.black : Colors.transparent),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyles.body
                .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
