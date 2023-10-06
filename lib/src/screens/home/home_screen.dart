import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';
import 'package:silky_care/src/screens/advertising/widgets/card_widget.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'assets/image/photo1.png',
    'assets/image/photo2.png',
    'assets/image/photo3.png',
    'assets/image/photo4.png',
    'assets/image/photo5.png',
  ];
  List<String> categories = [
    'Скидки',
    'Крема',
    'Крема',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 14,
              ),
              Container(
                height: 220,
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Каталог продуктов',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 24,
              ),
              ScTextField(
                lableText: 'Поиск',
              ),
              SizedBox(
                height: 24,
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
                height: 24,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 4,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return CardWidget(
                    image: 'assets/image/photo3.png',
                    name: 'acaasdadasdasdadsadasdasdasdcasc',
                    descriotions: 'ascwadawdaefsweefwefwefewfasc',
                    price: '1500 тг',
                  );
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
