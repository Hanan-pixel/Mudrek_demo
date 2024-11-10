import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mudrek_demo/pages/account_page.dart';
import 'package:mudrek_demo/pages/home_page.dart';
import 'package:mudrek_demo/pages/record_page.dart';
import 'package:mudrek_demo/pages/shopping_list_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            RecordPage(),
            ShoppingListPage(),
            AccountPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // optional, remove to disable shadow
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('الرىيسيه'),
            activeColor: Color(0xFF2F3AA6),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('السجل'),
            activeColor:Color(0xFF2F3AA6),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('قاىمه التسوق'),
            activeColor: Color(0xFF2F3AA6),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('الحساب'),
            activeColor:Color(0xFF2F3AA6),
          ),
        ],
      ),
    );
  }
}
