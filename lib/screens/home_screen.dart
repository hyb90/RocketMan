import 'package:flutter/material.dart';
import 'package:rocketman/screens/next_launch_screen.dart';
import 'package:rocketman/screens/upcoming_launches_screen.dart';
import 'package:flutter/cupertino.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int pageIndex=0;
  PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController(initialPage: 0);
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex=pageIndex;
    });
  }
  onTap(int pageIndex){
    pageController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds:500 ),
        curve: Curves.easeInOut
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        children: <Widget>[
          NextLaunchScreen(),
          UpcomingScreen(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon:Icon( Icons.launch),label: 'Next Launch'),
          BottomNavigationBarItem(icon:Icon( Icons.list_alt_outlined),label: 'Upcoming Launches'),

        ],
      ),
    );

  }

}
