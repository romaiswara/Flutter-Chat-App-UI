import 'package:flutter/material.dart';

import '../app_color.dart';
import '../model/chat_model.dart';

class ChatPage extends StatelessWidget {
  final List<Chat> chatings = [
    Chat(
      name: 'Seo Dal Mi',
      image: 'assets/images/seodalmi.jpg',
      time: '2:30',
      message: 'How are you guys?',
    ),
    Chat(
      name: 'Han Ji Pyeong',
      image: 'assets/images/hanjipyong.jpg',
      time: '3:11',
      message: 'Find here :P',
    ),
    Chat(
      name: 'Nam Do San',
      image: 'assets/images/namdosan.jpg',
      time: '22:08',
      message: 'Thinking about how to deal with this client from hell...',
    ),
    Chat(
      name: 'Seo In Jae',
      image: 'assets/images/seoinjae.jpg',
      time: '23:11',
      message: 'Love them',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // title
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/startup.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Start Up',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          '14,209 members',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primary,
                    ),
                    child: Icon(
                      Icons.local_phone_rounded,
                      color: AppColor.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    itemCount: chatings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: (index == 0) ? 0 : 30),
                        child: ChatWidget(
                          contact: chatings[index],
                          isMe: chatings[index].name == 'Nam Do San',
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    bottom: 30,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(75),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Type message...',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFEAEFF3),
                            ),
                            child: Icon(
                              Icons.send,
                              color: AppColor.textColorMessage,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  final Chat contact;
  final bool isMe;

  ChatWidget({this.contact, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(contact.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isMe ? AppColor.white : AppColor.backgroundBubble,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(isMe ? 30 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.message,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xFF505C6B),
                        ),
                    textDirection: TextDirection.ltr,
                    textAlign: (isMe) ? TextAlign.right : TextAlign.left,
                  ),
                  Text(
                    contact.time,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Color(0xFF505C6B),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
