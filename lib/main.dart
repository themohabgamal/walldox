import 'package:flutter/material.dart';
import 'package:walldox/fullscreen.dart';
import 'package:walldox/wallpaper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walldox',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: Wallpaper.routeName,
      routes: {
        Fullscreen.routeName: (context) => Fullscreen(),
        Wallpaper.routeName: (context) => Wallpaper()
      },
    );
  }
}
