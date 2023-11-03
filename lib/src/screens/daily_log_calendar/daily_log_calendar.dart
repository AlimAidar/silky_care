import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';

class DailyLogCalendar extends StatefulWidget {
  DailyLogCalendar({Key? key}) : super(key: key);

  @override
  State<DailyLogCalendar> createState() => _DailyLogCalendarState();
}

class _DailyLogCalendarState extends State<DailyLogCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Text('Уход',style: TextStyles.head1,),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Text('Месячные',style: TextStyles.head1,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
