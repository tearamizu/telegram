import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';

class ChatPage extends StatefulWidget{
  final Map<String, dynamic> chatData;

  ChatPage({super.key, required this.chatData});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final AppColor appColor = AppColor();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: appColor.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.chatData['profilePicture'].toString()),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatData['name'].toString(),
                    style: TextStyle(
                      color: appColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.chatData['last_seen'].toString(),
                    style: TextStyle(
                      color: appColor.lightGray,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: appColor.primary,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              color: appColor.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: appColor.linearGradientBlue,
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.chatData['messages'].length ,
            itemBuilder: (context, index) {
              final message = widget.chatData['messages'][index];
              final nextMessage = (index + 1 < widget.chatData['messages'].length)
              ? widget.chatData['messages'][index + 1]
              : null;
              bool chainedMessage = false;
              if (nextMessage != null && (message['isMe'] as bool) == (nextMessage['isMe'] as bool)) {
                chainedMessage = true;
              }
              final isMe = message['isMe'] == true;
            
              return Align(
                alignment: isMe? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: chainedMessage ?  EdgeInsets.symmetric(horizontal: 5) : EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
                  decoration: BoxDecoration(
                    color: isMe? appColor.myBubbleChat : appColor.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ((message['text'].length) as int <= 11)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message['text'].toString(),
                            style: TextStyle(
                              color: appColor.black,
                              fontSize: 16,
                              ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            message['time'].toString(),
                            style: TextStyle(
                              color: appColor.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 5),
                          if(isMe)
                          Icon(
                              Icons.done_all,
                              color: appColor.readedIndicator,
                              size: 14,
                            )
                        ],
                      )
                      else
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message['text'].toString(),
                            style: TextStyle(
                              color: appColor.black,
                              fontSize: 16,
                              ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                message['time'].toString(),
                                style: TextStyle(
                                  color: appColor.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 5),
                              if(isMe)
                              Icon(
                                  Icons.done_all,
                                  color: appColor.readedIndicator,
                                  size: 14,
                                )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}