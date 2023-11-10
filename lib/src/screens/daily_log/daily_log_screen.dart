import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/screens/daily_log/widgets/week_widget.dart';

class DailyLogScreen extends StatefulWidget {
  DailyLogScreen({Key? key}) : super(key: key);

  @override
  State<DailyLogScreen> createState() => _DailyLogScreenState();
}

class _DailyLogScreenState extends State<DailyLogScreen> {
  List<Map> items = [
    {
      'isSelected': false,
      'week': 'П',
    },
    {
      'isSelected': true,
      'week': 'В',
    },
    {
      'isSelected': false,
      'week': 'С',
    },
    {
      'isSelected': false,
      'week': 'Ч',
    },
    {
      'isSelected': false,
      'week': 'П',
    },
    {
      'isSelected': false,
      'week': 'С',
    },
    {
      'isSelected': false,
      'week': 'В',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Text(
                  'Сегодня, 26 января',
                  style: TextStyles.head1,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutingConst.dailyLogCalendar,
                    );
                  },
                  child: SvgPicture.asset('assets/icons/Calender.svg'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 24),
            child: SizedBox(
              height: 130,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WeekWidget(
                    isSelected: items[index]['isSelected'],
                    week: items[index]['week'],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 3,
                  );
                },
                itemCount: items.length,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Отчет для ухода',
                  style: TextStyles.head1,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Утренний уход',
                              style: TextStyles.body,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.brightness_2_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Вечерний уход',
                              style: TextStyles.body,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ScButton(
                  onPressed: () {},
                  label: 'Сделать селфи',
                  suffixIcon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Менструация',
                  style: TextStyles.head1,
                ),
                SizedBox(
                  height: 15,
                ),
                ScButton(
                  onPressed: () {},
                  label: 'Менструальный цикл',
                  suffixIcon: Icon(
                    Icons.water_drop_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
