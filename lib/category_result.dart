import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walldox/api.dart';
import 'package:walldox/fullscreen.dart';

class CategoryResult extends StatelessWidget {
  static const String routeName = 'res';
  const CategoryResult({super.key});

  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          query,
          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 25)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
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
      ),
    );
  }
}
