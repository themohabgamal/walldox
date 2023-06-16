// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:walldox/wallpaper.dart';

class Fullscreen extends StatefulWidget {
  static const String routeName = 'fullscreen';
  Fullscreen({super.key});

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  Future<void> setWallpaper(String imageUrl) async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(imageUrl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Walldox",
          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 30)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ))),
          GestureDetector(
            onTap: () {
              setState(() {
                setWallpaper(imageUrl);
                var snackBar = SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.lime,
                    content: Text(
                      'Wallpaper was set successfully!',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black)),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(31, 137, 137, 137),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Set as Wallpaper",
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, letterSpacing: 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
