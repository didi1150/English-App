import 'package:eng_app_v2/pages/accountPage.dart';
import 'package:eng_app_v2/pages/homePage.dart';
import 'package:eng_app_v2/pages/statPage.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final String title;

  const MyScaffold({super.key, this.title = 'Too Good To Waste'});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int selectedIndex = 0;
  late Widget selectedPage;

  @override
  void initState() {
    super.initState();
    selectedPage = _pages[selectedIndex];
  }

  final List<Widget> _pages = <Widget>[
    HomePage(),
    AccountPage(),
    StatisticsPage()
  ];
  @override
  Widget build(BuildContext context) {
    void onTapped(int index) {
      setState(() {
        selectedIndex = index;
        selectedPage = _pages[selectedIndex];
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 25)),
          shadowColor: Colors.black,
          elevation: 5,
          backgroundColor: Colors.white,
        ),
        body: GestureDetector(
            onTap: () {
              setState(() {
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            child: selectedPage),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Your Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_exploration), label: 'Statistics')
          ],
          backgroundColor: Colors.white,
          elevation: 10,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: onTapped,
        ));
  }
}
