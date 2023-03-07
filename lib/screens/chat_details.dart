import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/models/user.dart';
import 'package:whatsapp_clone/widgets/chat_buble.dart';

import '../models/message_model.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({Key? key, required this.details}) : super(key: key);
  User details;
  TextEditingController _msg_ctrlr = TextEditingController();

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  bool show_send = false;
  bool show_emoji = false;
  FocusNode focus_node = FocusNode();
  List<Message> messageList = [
    Message(isSend: true, message: 'heloo', time: ' 10.00 PM', isRead: false),
    Message(isSend: false, message: 'doi', time: '6.00 AM', isRead: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff128C7E),
        leadingWidth: 80,
        titleSpacing: 0,
        leading: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 5,
            ),
            // IconButton(onPressed:() => Navigator.pop(context) , icon: Icon(Icons.arrow_back)),
            CircleAvatar(
                radius: 20,
                // child: Text(),
                backgroundImage: NetworkImage(
                  widget.details.avatar == ''
                      ? widget.details.isGroup == true
                          ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                          : 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                      : widget.details.avatar.toString(),
                )),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(
              'last seen ${widget.details.updatedAt}',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? const Text("Group info")
                      : const Text("view contact"),
                ),
                PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? const Text("Group media")
                      : const Text('Media,Links and docs'),
                ),
                const PopupMenuItem(child: const Text('search')),
                const PopupMenuItem(child: const Text('DisapearingMessage')),
                const PopupMenuItem(child: const Text('Mute notification')),
                const PopupMenuItem(child: const Text('wallppaper')),
                const PopupMenuItem(child: const Text('more'))
              ];
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM7zjumQs3leueOOCILKlf3dx1SrZzI50sKA&usqp=CAU"))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) => ChatBuble(
                message: messageList[index],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: widget._msg_ctrlr,
                        onTap: () {
                          if (show_emoji) {
                            focus_node.unfocus();
                          }
                          // print('--------------------------');
                          // print(show_emoji);
                        },
                        focusNode: focus_node,
                        onChanged: (value) {
                          print(value.length);
                          if (value.length > 0) {
                            setState(() {
                              show_send = true;
                            });
                          } else {
                            setState(() {
                              show_send = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIconColor: Colors.grey,
                          focusedBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 12),
                          hintText: 'Message',
                          icon: IconButton(
                            icon: Icon(show_emoji
                                ? Icons.keyboard
                                : Icons.emoji_emotions_outlined),
                            color: Colors.grey,
                            onPressed: () {
                              focus_node.unfocus();
                              setState(() {
                                show_emoji = !show_emoji;
                              });
                              if (!show_emoji) {
                                focus_node.requestFocus();
                              }
                            },
                          ),
                          suffixIcon: showIcon(show_send),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          print(widget._msg_ctrlr.text);
                          setState(() {
                            messageList.add(
                              Message(
                                  message: widget._msg_ctrlr.text,
                                  isRead: false,
                                  isSend: true,
                                  time: '10.00PM'),
                            );
                          });

                          widget._msg_ctrlr.clear();

                          print(messageList);
                        },
                        child: CircleAvatar(
                          radius: 23,
                          child: Icon(show_send ? Icons.send : Icons.mic),
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    )
                  ],
                ),
                show_emoji ? select_emoji() : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row showIcon(bool sent) {
    if (sent) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => menu(),
              );
            },
            icon: Icon(Icons.attach_file),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.attach_file),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.camera_alt)
        ],
      );
    }
  }

  Container menu() => Container(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      Icon(Icons.insert_drive_file), 'Document', Colors.indigo),
                  iconWidget(Icon(Icons.camera_alt), 'Camera', Colors.pink),
                  iconWidget(
                      Icon(Icons.insert_photo), 'Gallery', Colors.purple),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconWidget(Icon(Icons.headphones), 'Audio', Colors.orange),
                    iconWidget(
                        Icon(Icons.location_pin), 'Location', Colors.teal),
                    iconWidget(
                        Icon(Icons.contact_phone), 'Contact', Colors.blue)
                  ],
                ),
              ),
            ],
          ),
        ),
        color: Colors.transparent,
        height: 270,
      );

  GestureDetector iconWidget(Icon icon, String text, Color color) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: icon,
            backgroundColor: color,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget select_emoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        widget._msg_ctrlr.text += emoji.emoji;
      },
    );
  }
}

         // ListView(
            //   children: [
            //     SendMessage(
            //       sendText: 'Hello mister..',
            //       sendTime: '10.00 PM ',
            //       isRead: true,
            //     ),
            //     SendMessage(
            //         sendText: 'hey...', sendTime: '10.00 PM', isRead: true),
            //     RecievedMessage(sendText: 'hey..', sendTime: '6.00 AM')
            //   ],
            // ),
