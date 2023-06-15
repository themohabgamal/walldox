import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:walldox/wallpaper.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(Wallpaper.routeName));

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
            height: double.infinity,
            child: Lottie.asset("assets/animations/splash.json",
                fit: BoxFit.cover)),
        Center(
            child: Text(
          "Walldox",
          style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.w700),
        )),
      ]),
    );
  }
}
