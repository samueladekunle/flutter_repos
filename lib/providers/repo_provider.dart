import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_repos/models/models.dart';
import 'package:flutter_repos/utils/utils.dart';

class RepoProvider {
  String get url => 'https://api.github.com/search/repositories?q=flutter+language:dart';

  Future<List<Repo>> fetchRepos() async {
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
          final Map<String, dynamic> responseMap = json.decode(response.body);
          final List<Map<String, dynamic>> items = responseMap['items'].map<Map<String, dynamic>>((dynamic data) => Map<String, dynamic>.from(data)).toList();
          return items.map<Repo>((Map<String, dynamic> map) => Repo.fromMap(map)).toList();
      } else {
        throw AppException('No Data Found');
      }
    } on SocketException {
      throw AppException('No Internet connection');
    }
  }
}