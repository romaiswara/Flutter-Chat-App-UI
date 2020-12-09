import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../app_color.dart';
import '../model/chat_model.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  final List<Chat> friends = [
    Chat(
      name: 'Seo Dal Mi',
      image: 'assets/images/seodalmi.jpg',
      time: 'now',
      message: 'Thinking about how to deal with this client from hell..',
    ),
    Chat(
      name: 'Han Ji Pyeong',
      image: 'assets/images/hanjipyong.jpg',
      time: '2:30',
      message: 'Thinking about how to deal with this client from hell..',
    ),
    Chat(
      name: 'Seo In Jae',
      image: 'assets/images/seoinjae.jpg',
      time: '11:11',
      message: 'Thinking about how to deal with this client from hell..',
    ),
  ];

  final List<Chat> groups = [
    Chat(
      name: 'Start up',
      image: 'assets/images/startup.jpg',
      time: '7:11',
      message: 'Thinking about how to deal with this client from hell..',
    ),
    Chat(
      name: 'Sand Box',
      image: 'assets/images/sandbox.jpg',
      time: '7:11',
      message: 'Thinking about how to deal with this client from hell..',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: AppColor.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 40),

                  // PROFILE
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/namdosan.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/circle.png'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // NAME
                  Text(
                    'Nam Do San',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 2),

                  // JOB
                  Text(
                    'Software Engineer',
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              // LIST CHAT
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Friends',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 16),
                    ...List.generate(
                      friends.length,
                      (index) => Container(
                        margin: EdgeInsets.only(top: (index == 0) ? 0 : 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                          },
                          child: CardContact(
                            contact: friends[index],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Groups',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 16),
                    ...List.generate(
                      groups.length,
                      (index) => Container(
                        margin: EdgeInsets.only(top: (index == 0) ? 0 : 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                          },
                          child: CardContact(
                            contact: groups[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  final Chat contact;

  CardContact({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(contact.image),
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
                contact.name,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                contact.message,
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Text(
          contact.time,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
