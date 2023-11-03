import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class CategoryDetailScreen extends StatefulWidget {
  CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int selectedIndex = 0;
  List<String> categories = [
    'Об продукте',
    'Ингредеенты  ',
    'Как использовать',
  ];
  List<String> images = [
    'assets/image/photo1.png',
    'assets/image/photo2.png',
    'assets/image/photo3.png',
    'assets/image/photo4.png',
    'assets/image/photo5.png',
  ];

  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        curve: Curves.bounceIn,
                      );
                    },
                    pagination: SwiperPagination(),
                    itemCount: images.length,
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 15,
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
                  top: 15,
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
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Название бренда',
                    style: TextStyles.body,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Название продуктов и например 100мл',
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
                    height: 16,
                  ),
                  Text(
                    'Experience the power of natural skin care with this luxurious and hydrating skin care line. Our scientifically-formulated ingredients are carefully blended to nourish and protect your skin, delivering lasting hydration and a youthful glow. Our gentle yet effective products are perfect for all skin types, leaving skin feeling softer and smoother. With a combination of exotic extracts and essential oils, your skin will be nourished and refreshed. Enjoy the benefits of natural, healthy skin with our skin care line.',
                    style: TextStyles.body,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutingConst.basket);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/shopping_bag.svg'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Добавить в корзину',
                  style: TextStyles.buttonStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
