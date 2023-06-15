import 'dart:convert';

import 'package:walldox/response_model.dart';
import 'package:http/http.dart' as http;

class API {
  String api = "iQAG9Pd6BTA4IHEck7fgjiKYU3deEeoQKpliI79Q3ZJnRg6j5J5oSBEy";
  static Future<ResponseModel> getWallpapers(int page) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=80&page=${page.toString()}"),
        headers: {
          "Authorization":
              "iQAG9Pd6BTA4IHEck7fgjiKYU3deEeoQKpliI79Q3ZJnRg6j5J5oSBEy"
        });
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return ResponseModel.fromJson(json);
  }
}
