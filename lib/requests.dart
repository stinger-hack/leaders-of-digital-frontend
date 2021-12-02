import 'package:http/http.dart' as http;
import 'dart:convert';
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
      throw ("getCategories bad status code: " + response.statusCode.toString());
    }
  }
}
