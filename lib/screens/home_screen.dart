import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/calls_screen.dart';

import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/chat_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tb;
  @override
  void initState() {
    super.initState();
    _tb = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'whatsapp',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Calls',
              ),
            ],
            controller: _tb,
          ),
          backgroundColor: Color(0xff128C7E),
          actions: [
            Icon(Icons.search),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text('new group'),
                    value: 1,
                  ),
                  const PopupMenuItem(
                    child: Text('settings'),
                    value: 100,
                  ),
                ];
              },
            )
          ]),
      body: TabBarView(
        children: [
          CameraScreen(),
          ChatList(),
          Text('Status'),
          CallScreen(),
        ],
        controller: _tb,
      ),
    );
  }
}
