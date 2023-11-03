import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:weekday_selector/weekday_selector.dart';

class DailyLogScreen extends StatefulWidget {
  DailyLogScreen({Key? key}) : super(key: key);

  @override
  State<DailyLogScreen> createState() => _DailyLogScreenState();
}

class _DailyLogScreenState extends State<DailyLogScreen> {
  List<bool> values = List.filled(7, false);

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
            height: 140,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
            child: WeekdaySelector(
              onChanged: (int day) {
                // setState(() {
                //   // Use module % 7 as Sunday's index in the array is 0 and
                //   // DateTime.sunday constant integer value is 7.
                //   final index = day % 7;
                //   // We "flip" the value in this example, but you may also
                //   // perform validation, a DB write, an HTTP call or anything
                //   // else before you actually flip the value,
                //   // it's up to your app's needs.
                //   values[index] = !values[index];
                // });
              },
              values: values,
              selectedElevation: 15,
              elevation: 5,
              disabledElevation: 0,
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
                            horizontal: 10, vertical: 6),
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
                            horizontal: 10, vertical: 6),
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
