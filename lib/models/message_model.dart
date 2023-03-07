// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({this.message, this.time, this.isSend, this.isRead});

  String? message;
  String? time;
  bool? isSend;
  bool? isRead;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        time: json["time"],
        isSend: json["isSend"],
        isRead: json["isRead"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "time": time,
        "isSend": isSend,
        "isRead": isRead
      };
}
