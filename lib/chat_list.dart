import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';
import 'package:telegram/chat_page.dart';
import 'package:telegram/data/chat_data.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                InkWell(
                  hoverColor: appColor.invisible,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ChatPage(chatData: chatData[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          chatData[index]['profilePicture'].toString(),
                        ),
                      ),
                    ),
                    title: Text(
                      chatData[index]['name'].toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      (() {
                        final messages =
                            chatData[index]['messages']
                                as List<Map<String, dynamic>>?;
                        final lastMessage =
                            messages?.isNotEmpty == true
                                ? messages!.last['text']
                                : null;
                        return (lastMessage?.toString() ?? '');
                      })(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: appColor.grey, fontSize: 15),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (() {
                            final messages =
                                chatData[index]['messages']
                                    as List<Map<String, dynamic>>?;
                            final lastMessage =
                                messages?.isNotEmpty == true
                                    ? messages!.last['time']
                                    : null;
                            return (lastMessage?.toString() ?? '');
                          })(),
                          style: TextStyle(color: appColor.grey, fontSize: 15),
                        ),
                        SizedBox(height: 0.25),
                        if (((chatData[index]['unread_messages'] ?? 0)
                                as int) >=
                            1)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: appColor.green,
                                size: 24,
                                weight: 1,
                              ),
                              Text(
                                chatData[index]['unread_messages'].toString(),
                                style: TextStyle(
                                  color: appColor.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        else if (chatData[index]['is_pinned'] == true)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.rotate(
                                angle: 0.7854,
                                child: Icon(
                                  Icons.push_pin,
                                  color: appColor.grey,
                                  size: 14,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: appColor.grey,
                                size: 24,
                                weight: 1,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Divider(color: appColor.lightGray, height: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
