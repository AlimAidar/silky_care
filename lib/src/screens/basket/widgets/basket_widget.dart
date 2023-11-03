import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class BasketWidget extends StatefulWidget {
  const BasketWidget({
    Key? key,
    required this.controller,
    required this.images,
    required this.descriotion,
    required this.price,
  }) : super(key: key);

  final TextEditingController controller;
  final String images;
  final String descriotion;
  final String price;

  @override
  State<BasketWidget> createState() => _BasketWidgetState();
}

class _BasketWidgetState extends State<BasketWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 107,
          height: 114,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.images,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 195,
                  child: Text(
                    widget.descriotion,
                    style: TextStyles.body,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/trash.svg',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            // ScDivider(
            //   color: AppColors.grey1,
            // ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: InkWell(
                    onTap: () {
                      int currentValue = int.parse(widget.controller.text);
                      setState(() {
                        currentValue--;
                        widget.controller.text =
                            (currentValue > 0 ? currentValue : 0)
                                .toString(); // decrementing value
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.grey4,
                        ),
                        child: SvgPicture.asset('assets/icons/minus.svg')),
                  ),
                ),
                SizedBox(
                    width: 40,
                    height: 24,
                    child: ScTextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: widget.controller,
                      borderColor: Colors.transparent,
                      enableBorderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      lableText: '',
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: InkWell(
                    onTap: () {
                      int currentValue = int.parse(widget.controller.text);
                      setState(() {
                        currentValue++;
                        widget.controller.text =
                            (currentValue).toString(); // incrementing value
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.grey4,
                        ),
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset('assets/icons/plus.svg')),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('Цена: ${widget.price}')
          ],
        )
      ],
    );
  }
}
