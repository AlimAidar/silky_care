import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class ScCheckBox extends StatefulWidget {
  final String title;
  final Widget? titleWidget;
  final bool isChecked;
  final Function(bool)? onChanged;

  const ScCheckBox({
    Key? key,
    this.isUnderlined = true,
    this.readOnly = false,
    required this.title,
    this.isChecked = false,
    this.onChanged,
  })  : titleWidget = null,
        super(key: key);

  const ScCheckBox.custom({
    Key? key,
    required Widget title,
    this.readOnly = false,
    this.isChecked = false,
    this.onChanged,
  })  : title = '',
        titleWidget = title,
        isUnderlined = false,
        super(key: key);

  final bool isUnderlined;
  final bool readOnly;

  @override
  State<ScCheckBox> createState() => _ScCheckBoxState();
}

class _ScCheckBoxState extends State<ScCheckBox> {
  bool checkBoxValue = false;

  @override
  void initState() {
    checkBoxValue = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.readOnly) {
          return;
        }
        setState(() {
          checkBoxValue = !checkBoxValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(checkBoxValue);
        }
      },
      child: LimitedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: checkBoxValue,
                splashRadius: 0,
                activeColor: AppColors.yellow,
                onChanged: (bool? newValue) {
                  if (widget.readOnly) {
                    return;
                  }
                  setState(() {
                    checkBoxValue = !checkBoxValue;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue ?? false);
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: widget.titleWidget ??
                  Text(
                    widget.title,
                    style: widget.isUnderlined
                        ? TextStyles.body.copyWith(
                            decoration: TextDecoration.underline,
                          )
                        : TextStyles.body,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
