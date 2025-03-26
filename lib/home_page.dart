import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';
import 'package:telegram/chat_list.dart';

class HomePages extends StatefulWidget{
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final AppColor appColor = AppColor();
  bool _isLoading = true;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    //Nyobain loading 5 detik
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram',
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: appColor.white,
          ),
          title: Text(
            _isLoading ? 'Connecting...' : 'Telegram',
            style: TextStyle(
              color: appColor.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: appColor.primary,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: appColor.white,
              ),
              onPressed: (){},
            ),
          ],
        ),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0)
            ),
          ),
          backgroundColor: appColor.white,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: appColor.primary,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg',
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yeremia Christian C. O.',
                                    style: TextStyle(
                                      color: appColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '+62 812 5942 xxxx',
                                    style: TextStyle(
                                      color: appColor.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: appColor.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(
                        angle: -2.4,
                        child: Icon(
                              Icons.nightlight_round,
                              color: appColor.white,
                              size: 24,
                            ),
                      )
                    ),
                  ],
                ),
              ),
              if (_isExpanded)
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg',
                      ),
                      maxRadius: 16,
                    ),
                    title: Text(
                      'Yeremia Christian C. O.',
                      style: TextStyle(
                        color: appColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add
                    ),
                    title: Text(
                      'Add Account',
                      style: TextStyle(
                        color: appColor.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(
                    color: appColor.lightGray,
                    height: 1,
                  ),
                ]
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'My Profile',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              Divider(
                color: appColor.lightGray,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.group_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'New Group',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(
                  Icons.person_2_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'Contacts',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(
                  Icons.phone_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'Calls',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'Saved Messages',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              Divider(
                color: appColor.lightGray,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.person_add_outlined,
                  color: appColor.grey,
                ),
                title: Text(
                  'Invite Friends',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: appColor.grey,
                ),
                title: Text(
                  'Telegram Features',
                  style: TextStyle(
                    color: appColor.black,
                    fontSize: 18,
                  ),
                ),
                onTap: (){},
              ),
            ],
          ),
        ),
        body: ChatList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: appColor.primary,
          shape: CircleBorder(),
          child: Icon(
            Icons.edit,
            color: appColor.white,
          ),
        ),
      ),
    );
  }
}