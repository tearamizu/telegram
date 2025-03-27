import 'package:flutter/material.dart';
import 'package:telegram/app_color.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> chatData;

  const ChatPage({super.key, required this.chatData});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final AppColor appColor = AppColor();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  bool _isEmojiVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    _textController.addListener(() {
      setState (() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: appColor.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.chatData['profilePicture'].toString(),
                ),
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
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: appColor.primary,
          actions: [
            IconButton(
              icon: Icon(Icons.phone),
              color: appColor.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: appColor.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: appColor.linearGradientBlue),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: widget.chatData['messages'].length,
                    itemBuilder: (context, index) {
                      final message = widget.chatData['messages'][index];
                      final nextMessage =
                          (index + 1 < widget.chatData['messages'].length)
                              ? widget.chatData['messages'][index + 1]
                              : null;
                      bool chainedMessage = false;
                      if (nextMessage != null &&
                          (message['isMe'] as bool) ==
                              (nextMessage['isMe'] as bool)) {
                        chainedMessage = true;
                      }
                      final isMe = message['isMe'] == true;

                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin:
                              chainedMessage
                                  ? EdgeInsets.only(
                                    top: 3,
                                    right: 5,
                                    left: 5,
                                    bottom: 1,
                                  )
                                  : EdgeInsets.only(
                                    top: 3,
                                    right: 5,
                                    left: 5,
                                    bottom: 4,
                                  ),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isMe ? appColor.myBubbleChat : appColor.white,
                            borderRadius:
                                isMe
                                    ? BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    )
                                    : BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(3),
                                      topLeft: Radius.circular(15),
                                    ),
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
                                    if (isMe)
                                      Icon(
                                        Icons.done_all,
                                        color: appColor.readedIndicator,
                                        size: 14,
                                      ),
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
                                        if (isMe)
                                          Icon(
                                            Icons.done_all,
                                            color: appColor.readedIndicator,
                                            size: 14,
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: appColor.white,
                    border: Border(
                      top: BorderSide(color: appColor.lightGray!, width: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: appColor.grey,
                        ),
                        onPressed: _toggleEmojiKeyboard,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(color: appColor.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (_textController.text.isEmpty) ...[
                        Transform.rotate(
                          angle: -2.4,
                          child: IconButton(
                            icon: Icon(
                              Icons.attach_file,
                              color: appColor.grey
                            ),
                            onPressed: () {},
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: appColor.grey
                          ),
                          onPressed: () {},
                        ),
                      ] else
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.send, color: appColor.primary)
                        ),
                    ],
                  ),
                ),
                if (_isEmojiVisible)
                  SafeArea(
                    child: SizedBox(
                      height: 350,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          _textController.text += emoji.emoji;
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleEmojiKeyboard() {
    if (_isEmojiVisible) {
      FocusScope.of(context).requestFocus(FocusNode());
    } else {
      FocusScope.of(context).unfocus();
    }
    setState(() {
      _isEmojiVisible = !_isEmojiVisible;
    });
  }
}
