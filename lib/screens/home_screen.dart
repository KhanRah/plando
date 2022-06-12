import 'package:flutter/material.dart';
import 'package:plando/bloc/home_bloc.dart';
import 'package:plando/screens/dashboard.dart';
import 'package:plando/screens/profile_view.dart';
import 'package:plando/screens/service_requests_view.dart';
import 'package:plando/screens/settings_screen.dart';
import 'package:plando/utilities/app_colors.dart';
import 'package:plando/utilities/route_names.dart';
import 'package:plando/utilities/util_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {


  int _pageIndex = 0;
  PageController? _pageController;
  late HomeBloc _homeBloc;
  String label = "Dashboard";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = HomeBloc();
    _homeBloc.init();
    label = "Dashboard";
    _pageController = PageController(initialPage: _pageIndex);
  }


  List<Widget> tabPages = [
    DashBoard(),
    ServiceRequestsView(),
    DashBoard(),
    ProfileView(),
    // SettingsScreen()
  ];

  void onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
      if(index == 0){
        label = "Dashboard";
      }else if(index == 1){
        label = "Service Requests";
      }else if(index == 2){
        label = "Calendar";
      }else{
        label = "Profile";
      }

    });
  }

  void onTabTapped(int index) {
    if(index == 0){
      label = "Dashboard";
    }else if(index == 1){
      label = "Service Requests";
    }else if(index == 2){
      label = "Calendar";
    }else{
      label = "Profile";
    }
    _pageController!.animateToPage(index,duration: const Duration(milliseconds: 200),curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeBloc.scaffoldKey,
      backgroundColor: const Color(0xFFF0EDFD),
      appBar: AppBar(backgroundColor: Colors.blueAccent,title: Text("$label")),
      drawer: SideNav(),
      body:PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        height: 65.0,
        child: BottomNavigationBar(
          fixedColor: Colors.blueAccent,
          currentIndex: _pageIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_sharp), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.list_sharp), label: 'My Requests'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Profile")
          ],
        ),
      ),
    );
  }

}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}


class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 314;
    final double _yScaling = size.height / 463.15;
    path.lineTo(-27.4 * _xScaling,335.344 * _yScaling);
    path.cubicTo(-27.4 * _xScaling,335.344 * _yScaling,-3.935 * _xScaling,356.71 * _yScaling,44.157 * _xScaling,356.71 * _yScaling,);
    path.cubicTo(92.249 * _xScaling,356.71 * _yScaling,114.821 * _xScaling,293.745 * _yScaling,175.899 * _xScaling,300.769 * _yScaling,);
    path.cubicTo(236.977 * _xScaling,307.793 * _yScaling,255.26999999999998 * _xScaling,327.032 * _yScaling,311.012 * _xScaling,327.032 * _yScaling,);
    path.cubicTo(366.754 * _xScaling,327.032 * _yScaling,386.6 * _xScaling,247.758 * _yScaling,386.6 * _xScaling,247.758 * _yScaling,);
    path.cubicTo(386.6 * _xScaling,247.758 * _yScaling,386.6 * _xScaling,-6.441 * _yScaling,386.6 * _xScaling,-6.441 * _yScaling,);
    path.cubicTo(386.6 * _xScaling,-6.441 * _yScaling,-27.399999999999977 * _xScaling,-6.441 * _yScaling,-27.399999999999977 * _xScaling,-6.441 * _yScaling,);
    path.cubicTo(-27.399999999999977 * _xScaling,-6.441 * _yScaling,-27.4 * _xScaling,335.344 * _yScaling,-27.4 * _xScaling,335.344 * _yScaling,);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


