import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:silky_care/src/common/constants/colors_constant.dart';
import 'package:silky_care/src/common/constants/text_styles.dart';
import 'package:silky_care/src/common/widgets/sc_text_field.dart';

class SupportChatScreen extends StatefulWidget {
  SupportChatScreen({Key? key}) : super(key: key);

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: AppColors.grey3,
            child: Row(
              children: [
                Icon(Icons.watch_later_outlined),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Вам ответят в течении 30 мин ',
                  style: TextStyles.buttonStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ChatBubble(
                  clipper: ChatBubbleClipper1(
                      type: index.isEven || index == 0
                          ? BubbleType.sendBubble
                          : BubbleType.receiverBubble),
                  alignment: index.isEven || index == 0
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20),
                  backGroundColor: AppColors.grey2,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Text(
                      "I’d rather listen to a podcast, watch football, watch a movie, play football, or listen to  podcasts... ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
            color: AppColors.grey4,
            child: ScTextField(
              lableText: '',
              backgroundColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
