import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.speciality,
    required this.name,
    required this.year,
    required this.raiting,
    this.onPressedTime,
    required this.categories,
    this.selectedIndex,
  }) : super(key: key);

  final Function() onPressed;
  final Function()? onPressedTime;
  final String image;
  final String speciality;
  final String name;
  final String year;
  final double raiting;
  final List<String> categories;
  final bool? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: AppColors.grey2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speciality,
                  style: TextStyles.body,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  name,
                  style: TextStyles.body1.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Medikit.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Стаж работы — $year лет',
                      style: TextStyles.body,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: raiting,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.purple,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 35,
                  width: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        onPressed: onPressedTime ?? () {},
                        category: categories[index],
                        selectedIndex: selectedIndex ?? false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 6,
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
