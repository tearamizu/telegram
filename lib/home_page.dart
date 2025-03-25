import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';

class HomePages extends StatelessWidget{
  HomePages({super.key});
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: appColor.white,
          ),
          title: Text(
            'Telegram',
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
          backgroundColor: appColor.white,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: appColor.primary,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yeremia Christian C.O.',
                          style: TextStyle(
                            color: appColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '+62 812 xxxx xxxxx',
                          style: TextStyle(
                            color: appColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
        body: ListView(
          children: [
            Text(
              'Tilijram'
            )
          ],
        ),
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