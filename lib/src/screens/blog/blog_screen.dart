import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/advertising/widgets/card_widget.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int selectedIndex = 0;
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Полезные блоги',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Интересные и полезные блоги для вашего здоровья и красоты',
                style: TextStyles.buttonStyle,
              ),
              SizedBox(
                height: 20,
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
                    onPressedCard: () {
                      Navigator.pushNamed(context, RoutingConst.blogDetail);
                    },
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
