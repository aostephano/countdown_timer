import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:countdown_timer/pages/tabs/FirsScreen.dart';
import 'package:countdown_timer/pages/tabs/SecondScreen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  //Initiate Page Controller var
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  //Dispose Page Controller var
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown Timer"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.access_alarms_sharp),
          enableFeedback: false,
          onPressed: () {},
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            FirstScreen(),
            SecondScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.center,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Create Countdown'),
            icon: Icon(Icons.home),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal,
          ),
          BottomNavyBarItem(
            title: Text('History Countdown'),
            icon: Icon(Icons.access_alarm),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
