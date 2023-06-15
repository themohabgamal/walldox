import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walldox/api.dart';

import 'fullscreen.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          child: FutureBuilder(
            future: API.searchForWallpaper(query),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("error ${snapshot.error}"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              } else if (snapshot.hasData) {
                var wallpapers = snapshot.data?.photos;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Fullscreen.routeName,
                            arguments: wallpapers?[index].src?.large2x);
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
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}
