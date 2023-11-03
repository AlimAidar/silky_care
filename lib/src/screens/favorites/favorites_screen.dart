import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/advertising/widgets/card_widget.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> categories = [
    'Продукты',
    'Блог',
  ];

  int selectedIndex = 0;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Избранные',
            style: TextStyles.head,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/support.svg',
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 12,
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
                height: 8,
              ),
              selectedIndex == 0
                  ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 4,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          onPressedPrice: () {
                            Navigator.pushNamed(
                              context,
                              RoutingConst.categoryDetail,
                            );
                          },
                          image: 'assets/image/photo3.png',
                          name: 'acaasdadasdasdadsadasdasdasdcasc',
                          descriotions: 'ascwadawdaefsweefwefwefewfasc',
                          price: '1500 тг',
                        );
                      },
                      itemCount: 5,
                    )
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 3.5,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          onPressedCard: () {
                            Navigator.pushNamed(
                                context, RoutingConst.blogDetail);
                          },
                          image: 'assets/image/photo2.png',
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
