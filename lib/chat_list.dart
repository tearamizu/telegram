import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';
import 'package:telegram/data/chat_data.dart';

class ChatList extends StatelessWidget{
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
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            chatData[index]['profilePicture'].toString()
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
                        final messages = chatData[index]['messages'] as List<Map<String, dynamic>>?;
                        final lastMessage = messages?.isNotEmpty == true ? messages!.last['text'] : null;
                        return (lastMessage?.toString() ?? '');
                      })(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (() {
                            final messages = chatData[index]['messages'] as List<Map<String, dynamic>>?;
                            final lastMessage = messages?.isNotEmpty == true ? messages!.last['time'] : null;
                            return (lastMessage?.toString() ?? '');
                          })(),
                          style: TextStyle(
                            color: appColor.grey,
                            fontSize: 15,
                          ),
                        ),
                        if(chatData[index]['is_pinned'] == true)
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
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: appColor.lightGray,
                  height: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}