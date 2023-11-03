import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';

class DoctorDetailScreen extends StatefulWidget {
  DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  int selectedIndex = 0;
  bool favorite = false;
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
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
                  'Дерматолок',
                  style: TextStyles.buttonStyle.copyWith(
                    color: Colors.black.withOpacity(0.35),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Андрей Андреевич',
                  style: TextStyles.head,
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Medikit.svg'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Стаж работы — 15 лет',
                      style: TextStyles.body,
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'Врач с опытом более 10 лет поликлинической работы и помощи на дому. Осуществляет диагностику, лечение острых и хронических заболеваний у детей с 0 до 18 лет, профилактические осмотры, проконсультирует о сроках контроля врачами узких специальностей. Консультирует родителей детей до года по режиму дня, уходу, вопросам вскармливания. Интерпретирует заключения лабораторных ...',
                  style: TextStyles.body.copyWith(
                    color: Colors.black.withOpacity(0.35),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ScButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutingConst.calendar,
                );
              },
              label: 'Записаться',
            ),
          )),
    );
  }
}
