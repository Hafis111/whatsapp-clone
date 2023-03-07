import 'dart:convert';

CallList callListFromJson(String str) => CallList.fromJson(json.decode(str));

String callListToJson(CallList data) => json.encode(data.toJson());

class CallList {
  CallList({
    this.avatar,
    this.name,
    this.time,
    this.callType,
    this.icon,
  });

  String? avatar;
  String? name;
  String? time;
  String? callType;
  String? icon;

  factory CallList.fromJson(Map<String, dynamic> json) => CallList(
        avatar: json["Avatar"],
        name: json["name"],
        time: json["time"],
        callType: json["call_type"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "Avatar": avatar,
        "name": name,
        "time": time,
        "call_type": callType,
        "icon": icon,
      };
}
