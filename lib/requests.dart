import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/favorite_model.dart';
import 'models/showcase_model.dart';

class HttpRequests {
  final String url = 'https://stinger-hack.ru/';

  Future<List<Showcase>> getCategories() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/showcase/all'),
      headers: {'Content-type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final result = projectsModelFromJson(utf8.decode(response.bodyBytes));
      return result.showcase;
    } else {
      throw ("getCategories bad status code: " +
          response.statusCode.toString());
    }
  }

  Future<List<Favorite>> getFavorites() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/favorite'),
      headers: {'Content-type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final result = favoriteModelFromJson(utf8.decode(response.bodyBytes));
      return result.favorite;
    } else {
      throw ("getFavorites bad status code: " + response.statusCode.toString());
    }
  }

  Future<bool> postFavorites(String startup_id) async {
    print(json.encode({"startup_id": "$startup_id"}));
    final response = await http.post(
      Uri.parse(url + 'v1/api/favorite'),
      body: json.encode({"startup_id": "$startup_id"}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("postFavorites bad status code: " +
          response.statusCode.toString());
    }
  }

  Future<bool> deleteFavorite(String startup_id) async {
    final response = await http.delete(Uri.parse(url + 'v1/api/favorite'),
        body: {'startup_id': startup_id});
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("postFavorites bad status code: " +
          response.statusCode.toString());
    }
  }

  void getShowcase() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/showcase'),
      headers: {'Content-type': 'application/json'},
    );
    print("ффввв ${response.body}");
  }
}
