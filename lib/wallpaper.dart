// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walldox/api.dart';
import 'package:walldox/categories_screen.dart';
import 'package:walldox/fullscreen.dart';
import 'package:walldox/response_model.dart';
import 'package:walldox/search.dart';

class Wallpaper extends StatefulWidget {
  static const String routeName = 'wallpapers';
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Walldox",
          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 30)),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: FutureBuilder(
              future: API.getWallpapers(page),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("error ${snapshot.error}"),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasData) {
                  var wallpapers = snapshot.data?.photos;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 7),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Fullscreen.routeName,
                              arguments: wallpapers?[index].src?.portrait);
                        },
                        child: Container(
                          color: Colors.white,
                          child: Image.network(
                            "${wallpapers?[index].src?.tiny}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: wallpapers?.length,
                  );
                } else
                  return const SizedBox();
              },
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.black,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      page++;
                    });
                  },
                  child: Container(
                      child: Center(
                    child: Icon(
                      Icons.shuffle,
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoriesScreen.routeName);
                  },
                  child: Container(
                      child: Center(
                    child: Icon(
                      Icons.filter,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
