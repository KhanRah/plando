
import 'package:flutter/material.dart';
import 'package:plando/screens/splash_view.dart';
import 'package:plando/utilities/app_themes.dart';
import 'package:plando/utilities/route_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Base Project',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: SplashScreen(),
    );
  }
}