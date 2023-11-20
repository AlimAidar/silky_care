import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/basket/basket_screen.dart';
import 'package:silky_care/src/screens/blog/blog_screen.dart';
import 'package:silky_care/src/screens/daily_log/daily_log_screen.dart';
import 'package:silky_care/src/screens/doctor/doctor_screen.dart';
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
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/person_icon.svg'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutingConst.settings,
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.grey,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutingConst.favorite,
                );
              },
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
                    return DailyLogScreen();
                  case 2:
                    return BlogScreen();
                  case 3:
                    return DoctorScreen();
                  case 4:
                    return BasketScreen(
                      isMain: true,
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
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/baske.svg',
                color: Colors.black,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
