import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/screens/home/widgets/category_widget.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDate = DateTime.now();

  List<String> categories = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
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
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
