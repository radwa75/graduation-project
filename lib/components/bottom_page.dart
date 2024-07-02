import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sasa/components/fab_bar_bottom.dart';
import 'package:sasa/screens/child_home_page.dart';
import 'package:sasa/screens/contacts/add_contacts.dart';
import 'package:sasa/screens/main_page%5B1%5D.dart';
import 'package:sasa/screens/mapsexp.dart';

import '../screens/chat_screen.dart';


class BottomPage extends StatefulWidget {
  BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  late List<CameraDescription> cameras; // Define cameras variable
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    // Initialize the cameras and pages list
    cameras = [];
    pages = [
      HomeScreen(),
      AddContactsPage(),
      ChatScreen(),
      MAP2(),
      MainPage(cameras: cameras), // Pass cameras list here
    ];

    // Load available cameras
    availableCameras().then((value) {
      setState(() {
        cameras = value;
        pages = [
          HomeScreen(),
          AddContactsPage(),
          ChatScreen(),
          MAP2(),
          MainPage(cameras: cameras), // Update MainPage with available cameras
        ];
      });
    });
  }

  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: DefaultTabController(
        initialIndex: currentIndex,
        length: pages.length,
        child: Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: FABBottomAppBar(
            onTabSelected: onTapped,
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: "home"),
              FABBottomAppBarItem(iconData: Icons.contacts, text: "contacts"),
              FABBottomAppBarItem(iconData: Icons.chat, text: "chat"),
              FABBottomAppBarItem(iconData: Icons.person, text: "profile"),
              FABBottomAppBarItem(iconData: Icons.video_camera_back, text: "Video stream",),
            ],
          ),
        ),
      ),
    );
  }
}
