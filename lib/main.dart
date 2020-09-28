import 'package:flutter/material.dart';
import 'package:planet/screens/details_screen.dart';
import 'package:planet/screens/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName : (context) => HomeScreen(),
        Details.routerName : (context) => Details(),
      },
    );
  }
}