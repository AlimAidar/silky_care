import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class BlogDetailScreen extends StatefulWidget {
  BlogDetailScreen({Key? key}) : super(key: key);

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  int selectedIndex = 0;
  bool favorite = false;

  List<String> categories = [
    '15 мин',
    'Магазины',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/photo2.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 25,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white,
                        ),
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 25,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (favorite) {
                            favorite = false;
                          } else {
                            favorite = true;
                          }
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white,
                        ),
                        child: favorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Красивая кожа',
                style: TextStyles.buttonStyle.copyWith(
                  color: Colors.black.withOpacity(0.35),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Освежающая маска',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 35,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      category: categories[index],
                      selectedIndex: selectedIndex == index,
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
              SizedBox(
                height: 14,
              ),
              Text(
                'Experience the power of natural skin care with this luxurious and hydrating skin care line. Our scientifically-formulated ingredients are carefully blended to nourish and protect your skin, delivering lasting hydration and a youthful glow. Our gentle yet effective products are perfect for all skin types, leaving skin feeling softer and smoother. With a combination of exotic extracts and essential oils, your skin will be nourished and refreshed. Enjoy the benefits of natural, healthy skin with our skin care line.Experience the power of natural skin care with this luxurious and hydrating skin care line. Our scientifically-formulated ingredients are carefully blended to nourish and protect your skin, delivering lasting hydration and a youthful glow. Our gentle yet effective products are perfect for all skin types, leaving skin feeling softer and smoother. With a combination of exotic extracts and essential oils, your skin will be nourished and refreshed. Enjoy the benefits of natural, healthy skin with our skin care line.',
                style: TextStyles.body.copyWith(
                  color: Colors.black.withOpacity(0.35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
