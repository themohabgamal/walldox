// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walldox/category_result.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 25)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Nature");
                  },
                  child: CategoryCard(
                    title: 'Nature',
                    imageUrl:
                        'https://images.unsplash.com/photo-1618588507085-c79565432917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fHww&w=1000&q=80',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Black and White");
                  },
                  child: CategoryCard(
                    title: 'B&W',
                    imageUrl:
                        'https://images.pexels.com/photos/1529881/pexels-photo-1529881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Minimal");
                  },
                  child: CategoryCard(
                    title: 'mnml',
                    imageUrl:
                        'https://images.pexels.com/photos/2736834/pexels-photo-2736834.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Animals");
                  },
                  child: CategoryCard(
                    title: 'Animals',
                    imageUrl:
                        'https://images.pexels.com/photos/1386560/pexels-photo-1386560.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Space");
                  },
                  child: CategoryCard(
                    title: 'Space',
                    imageUrl:
                        'https://images.pexels.com/photos/220201/pexels-photo-220201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryResult.routeName,
                        arguments: "Cars");
                  },
                  child: CategoryCard(
                    title: 'Cars',
                    imageUrl:
                        'https://images.pexels.com/photos/831475/pexels-photo-831475.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
                // Add more categories here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  String title;
  String imageUrl;
  String query = '';

  CategoryCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
        color: Colors.grey[900],
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100.0,
              width: 220,
            ),
          ),
          SizedBox(width: 16.0),
          Text(title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              )),
          SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
