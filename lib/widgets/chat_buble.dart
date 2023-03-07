import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/models/message_model.dart';

class ChatBuble extends StatefulWidget {
  Message message;

  ChatBuble({required this.message});

  @override
  State<ChatBuble> createState() => _ChatBubleState();
}

class _ChatBubleState extends State<ChatBuble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.message.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 10, minWidth: 150),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Color(0xffdcf8c8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 26, top: 5, bottom: 10),
                child: Text(
                  widget.message.message!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 6,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        widget.message.time!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    widget.message.isRead!
                        ? Icon(
                            Icons.done_all,
                            color: Colors.blue,
                          )
                        : SizedBox(
                            width: 5,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
