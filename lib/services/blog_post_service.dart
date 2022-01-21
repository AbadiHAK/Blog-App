import 'dart:convert';

import 'package:blog_api/config.dart';
import 'package:blog_api/models/blog_post.dart';
import 'package:http/http.dart' as http;


Future<List<Posts>> fetchPost() async {
  final response =
      await http.get(Uri.parse('${AppConstant.BASE_URL + AppConstant.POSTS_URL}'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Posts>((json) => Posts.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}