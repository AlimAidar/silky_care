import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/person_icon.svg'),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/shop_icon.svg'),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Builder(
              builder: (context) {
                switch (selectedIndex) {
                  case 0:
                    return HomeScreen();
                  case 1:
                    return Container(
                      color: Colors.red,
                    );
                  case 2:
                    return Container(
                      color: AppColors.grey,
                    );
                  case 3:
                    return Container(
                      color: Colors.green,
                    );

                  default:
                    return const Center(child: Text('Oшибка'));
                }
              },
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            //     color: Colors.white,
            //     child: Row(
            //       children: [
            //         InkWell(
            //           onTap: () {},
            //           child: Container(
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: AppColors.grey3,
            //               borderRadius: BorderRadius.circular(360),
            //               // image: DecorationImage(
            //               //   image: AssetImage('assets/image/photo1.png'),
            //               // ),
            //             ),
            //             child: Icon(
            //               Icons.person,
            //               color: Colors.black.withOpacity(0.3),
            //             ),
            //           ),
            //         ),
            //         Spacer(),
            //         Spacer(),
            //         InkWell(
            //           onTap: () {},
            //           child: Container(
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               color: AppColors.grey,
            //               borderRadius: BorderRadius.circular(360),
            //               // image: DecorationImage(
            //               //   image: AssetImage('assets/image/photo1.png'),
            //               // ),
            //             ),
            //             child: Icon(
            //               Icons.shopping_cart_outlined,
            //               color: Colors.black.withOpacity(0.3),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: AppColors.white,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: AppColors.purple,
          selectedIndex: selectedIndex,
          destinations: <Widget>[
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/Sparkle.svg'),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/BookOpen.svg'),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/FirstAid.svg'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
