import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';
import 'package:silky_care/src/screens/doctor/widgets/doctor_widget.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                'Врачи',
                style: TextStyles.head,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Проконсультируйтесь с профессионалами',
                style: TextStyles.body2,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ScTextField(
                      prefixIcon: Icon(Icons.search),
                      lableText: 'Поиск',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutingConst.posts,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return DoctorWidget(
                    categories: categories,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutingConst.doctorDetail,
                      );
                    },
                    image: 'assets/image/photo2.png',
                    speciality: 'Дерматолог',
                    name: 'Андей Андреевич',
                    year: '15' ,
                    raiting: 4,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
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
