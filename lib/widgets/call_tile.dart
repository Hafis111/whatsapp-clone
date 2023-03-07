import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/models/calls.dart';

class CallTile extends StatefulWidget {
  CallTile({required this.data});
  CallList data;

  @override
  State<CallTile> createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.data.name.toString()),
      subtitle: Row(
        children: [
          widget.data.callType=="incoming"
          ?Icon(Icons.call_received): Icon(Icons.call_made),
          Text(widget.data.callType.toString()),


        ],
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.data.avatar.toString()),
      ),
      trailing: widget.data.icon == 'audio'
          ? Icon(Icons.call_outlined)
          : Icon(Icons.videocam_rounded),
    );
  }
}
