import 'package:custom_appbar/core/navbar.dart';
import 'package:custom_appbar/core/values.dart';
import 'package:custom_appbar/pages/academy.dart';
import 'package:custom_appbar/pages/home.dart';
import 'package:custom_appbar/pages/mail_box.dart';
import 'package:custom_appbar/pages/profile.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Widget> _pages = [
    HomePage(),
    AcademyPage(),
    MailBoxPage(),
    ProfilePage()
  ];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'ACL',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedPageIndex,
        onTapChanged: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          MenuItem(
            title: 'Inicio',
            icon: Icons.home,
            x: -0.9,
          ),
          MenuItem(
            title: 'Academy',
            icon: Icons.school,
            x: -0.3,
          ),
          MenuItem(
            title: 'Buzon',
            icon: Icons.question_answer_outlined,
            x: 0.3,
          ),
          MenuItem(
            title: 'Beneficios',
            icon: Icons.card_giftcard_outlined,
            x: 0.9,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
