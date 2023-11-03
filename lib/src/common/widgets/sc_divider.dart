import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';

class ScDivider extends Divider {
  const ScDivider({
    Key? key,
    Color color = AppColors.grey1,
    double thickness = 1,
  }) : super(
          key: key,
          color: color,
          thickness: thickness,
          height: 1,
        );
}

class IcVerticalDivider extends VerticalDivider {
  const IcVerticalDivider({
    Key? key,
    Color color = AppColors.grey2,
    double thickness = 1,
    bool isVertical = false,
  }) : super(
          key: key,
          color: color,
          thickness: thickness,
          width: 1,
        );
}
