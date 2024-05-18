import 'package:flutter/material.dart';
import 'package:socialko/views/base/chats/view.dart';
import 'package:socialko/views/base/home/view.dart';
import 'package:socialko/views/base/settings/view.dart';
import 'package:socialko/views/base/users/view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int current = 0;

  List<Widget> pages = [
    const HomeView(),
    const ChatsView(),
    const UsersView(),
    const SettingsView(),
  ];

  List<String> titles = [
    "Home",
    "Chats",
    "Users",
    "Settings",
  ];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.mark_chat_read_outlined,
    Icons.person_outlined,
    Icons.settings_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          pages.length,
          (index) => BottomNavigationBarItem(
              icon: Icon(icons[index]), label: titles[index]),
        ),
        currentIndex: current,
        onTap: (value) {
          current = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
