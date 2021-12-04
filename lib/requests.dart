import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/favorite_model.dart';
import 'models/news_model.dart';
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

  Future<List<NewsModel>> getNews() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/feed'),
      headers: {'Content-type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final result = newsModelFromJson(utf8.decode(response.bodyBytes));
      return result;
    } else {
      throw ("getNews bad status code: " + response.statusCode.toString());
    }
  }

  Future<bool> postFavorites(String startup_id) async {
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


  // Future<List> search(String text) async {
  //   final uri = Uri.http(url, '/v1/api/search', {'search_str': 'text'});
  //   final response = await http.get(uri);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     //return response.body;
  //   } else {
  //     throw ("search bad status code: " + response.statusCode.toString());
  //   }
  // }

  void getShowcase() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/showcase'),
      headers: {'Content-type': 'application/json'},
    );
    print("ффввв ${response.body}");
  }

  Future<List<Showcase>> getMyProjects() async {
    final response = await http.get(
      Uri.parse(url + 'v1/api/showcase/my'),
      headers: {'Content-type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final result = projectsModelFromJson(utf8.decode(response.bodyBytes));
      return result.showcase;
    } else {
      throw ("getFavorites bad status code: " + response.statusCode.toString());
    }
  }

  Future<bool> uploadSelectedFile(objFile) async {
    final request =
        http.MultipartRequest("POST", Uri.parse(url + 'v1/api/create_file'));
    request.files.add(http.MultipartFile(
        "upload_file", objFile.readStream, objFile.size,
        filename: objFile.name));
    var resp = await request.send();

    String result = await resp.stream.bytesToString();

    print(result);
    return true;
  }
}
