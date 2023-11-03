import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/basket/widgets/basket_widget.dart';

class BasketScreen extends StatefulWidget {
  BasketScreen({Key? key, required this.isMain}) : super(key: key);

  final bool isMain;

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<String> categories = [
    'Корзина',
    'Избранное',
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
        appBar: !widget.isMain
            ? AppBar(
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
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/support.svg',
                    ),
                  ),
                ],
                backgroundColor: Colors.white,
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'Корзина',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 12,
              ),
              // SizedBox(
              //   height: 35,
              //   child: ListView.separated(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return CategoryWidget(
              //         onPressed: () {
              //           setState(() {
              //             selectedIndex = index;
              //           });
              //         },
              //         category: categories[index],
              //         selectedIndex: selectedIndex == index,
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return SizedBox(
              //         width: 6,
              //       );
              //     },
              //     itemCount: categories.length,
              //   ),
              // ),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BasketWidget(
                    controller: controller,
                    price: '1500',
                    descriotion: 'Название продуктов и например 100мл',
                    images: 'assets/image/photo1.png',
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 5,
              )
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutingConst.payment);
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
                  '1300Тг',
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
