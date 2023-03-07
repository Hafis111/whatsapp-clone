import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/models/user.dart';
import 'package:whatsapp_clone/widgets/chat_tile.dart';

// import 'package:flutter/src/widgets/foundation.dart';
class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<User> chatlist = [
    User(
        avatar: "",
        name: "Shemmu",
        isGroup: false,
        updatedAt: "11.00",
        message: "Hi"),
    User(
        avatar:
            'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg?ixlib=rb-1.1.0&rect=638%2C2%2C795%2C745&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip',
        name: "Hisham",
        isGroup: false,
        updatedAt: "12.00",
        message: "Hlo"),
    User(
        avatar:
            'https://images.theconversation.com/files/304864/original/file-20191203-67028-qfiw3k.jpeg?ixlib=rb-1.1.0&rect=638%2C2%2C795%2C745&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip',
        name: "Naseeba",
        isGroup: false,
        updatedAt: "09:00",
        message: "Hlo"),
    User(
        avatar: "",
        name: "flutter",
        isGroup: true,
        updatedAt: "11.00",
        message: "Hi"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff128C7E),
        child: Icon(
          Icons.chat,
          size: 20.0,
        ),
      ),
      body: ListView.builder(
          itemCount: chatlist.length,
          itemBuilder: (BuildContext context, int index) {
            return ChatTile(data: chatlist[index]);
          }),
    );
  }
}
