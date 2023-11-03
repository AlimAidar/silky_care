import 'package:flutter/material.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/router/routing_const.dart';
import 'package:silky_care/src/screens/doctor/widgets/doctor_widget.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
          title: Text(
            'Ваши записи на прием',
            style: TextStyles.head,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return DoctorWidget(
                    onPressedTime: () {},
                    categories: categories,
                    selectedIndex: selectedIndex == index,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutingConst.doctorDetail,
                      );
                    },
                    image: 'assets/image/photo2.png',
                    speciality: 'Дерматолог',
                    name: 'Андей Андреевич',
                    year: '15',
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
