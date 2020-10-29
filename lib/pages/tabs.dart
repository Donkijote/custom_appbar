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
  PageController _pageController = PageController(
    initialPage: 0,
  );

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
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedPageIndex = page;
          });
        },
        children: [..._pages],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedPageIndex,
        onTapChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(
              milliseconds: 150,
            ),
            curve: Curves.easeInOut,
          );
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          Person(
            title: 'Inicio',
            icon: Icons.home,
            x: -.95,
          ),
          Person(
            title: 'Academy',
            icon: Icons.account_balance_outlined,
            x: -0.3,
          ),
          Person(
            title: 'Buzon',
            icon: Icons.message_outlined,
            x: 0.3,
          ),
          Person(
            title: 'Perfil',
            icon: Icons.person,
            x: .98,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
