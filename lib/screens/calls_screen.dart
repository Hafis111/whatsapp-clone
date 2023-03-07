import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/models/calls.dart';
import 'package:whatsapp_clone/widgets/call_tile.dart';

class CallScreen extends StatefulWidget {
  CallScreen({Key? key, required}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List<CallList> Call = [
    CallList(
        avatar:
            "data:image/jpeg;base64,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",
        name: 'Hafis',
        callType: "incoming",
        time: '10.00',
        icon: 'audio'
        ),
        
    CallList(
        avatar:
            "data:image/jpeg;base64,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",
        name: 'Shami',
        callType: "incoming",
        time: '10.00',
        icon: 'audio'),
    CallList(
        avatar:
            "data:image/jpeg;base64,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",
        name: 'Naseeba',
        callType: "outgoing",
        time: '10.00',
        icon: 'video'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Call.length,
          itemBuilder: (BuildContext context, int index) {
            return CallTile(data: Call[index]);
          }),
    );
  }
}