import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_button.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class DailyLogCalendar extends StatefulWidget {
  DailyLogCalendar({Key? key}) : super(key: key);

  @override
  State<DailyLogCalendar> createState() => _DailyLogCalendarState();
}

class _DailyLogCalendarState extends State<DailyLogCalendar> {
  DateTime _currentDate = DateTime.now();

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
          actions: [
            IconButton(
              onPressed: () {
                  Navigator.pushNamed(
                  context,
                  RoutingConst.supportChat,
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/support.svg',
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.grey2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScButton.text(
                    label: 'Уход',
                    onPressed: () {},
                  ),
                  ScButton.text(
                    label: 'Месячные',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  setState(() => _currentDate = date);
                },
                weekendTextStyle: const TextStyle(
                  color: Colors.red,
                ),
                selectedDayBorderColor: Colors.transparent,
                dayButtonColor: Colors.transparent,
                selectedDayButtonColor: AppColors.grey3,
                weekDayBackgroundColor: Colors.transparent,
                nextMonthDayBorderColor: Colors.transparent,
                prevMonthDayBorderColor: Colors.transparent,
                markedDateIconBorderColor: Colors.transparent,
                todayBorderColor: Colors.transparent,
                thisMonthDayBorderColor: Colors.transparent,
                weekdayTextStyle: TextStyles.body.copyWith(fontSize: 13),
                showHeader: false,
                customDayBuilder: (
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime day,
                ) {
                  return null;
                },
                weekFormat: false,
                height: 360.0,
                todayButtonColor: Colors.transparent,
                todayTextStyle: TextStyle(color: Colors.black),
                selectedDateTime: _currentDate,
                markedDateShowIcon: true,
                markedDateIconMaxShown: 1,
                daysHaveCircularBorder: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.grey2,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/image/photo1.png'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.grey4,
                                ),
                                child: Text(
                                  'Сегодня, 26 января',
                                  style: TextStyles.buttonStyle,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/emoji1.svg',
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Настроение',
                                          style: TextStyles.body,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/emoji2.svg',
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Сон',
                                          style: TextStyles.body,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Состояние кожи',
                                style: TextStyles.body,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Сухость',
                                style: TextStyles.body
                                    .copyWith(color: AppColors.grey4),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ScTextField(
                    lableText: '',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
