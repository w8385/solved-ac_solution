import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:class_parsing/models/problems.dart';
import 'package:class_parsing/models/pair.dart';

void requestClassTags() async {
  for (int i = 1; i <= 10; i++) {
    final response = await http.get(
        Uri.parse(
            "https://solved.ac/api/v3/search/problem?query=in_class:$i"));
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      final problems = Problems.fromJson(jsonDecode(response.body));
      Map<String, int> tagCount = {};
      for (final problem in problems.items) {
        for (final tag in problem.tags) {
          tagCount[tag.key] = (tagCount[tag.key] ?? 0) + 1;
        }
      }
      List<Pair> tagCountList = [];
      print('Class $i\n----------------');
      tagCount.forEach((key, value) {
        tagCountList.add(Pair(key, value));
      });
      tagCountList.sort((a, b) => b.right.compareTo(a.right));
      for (final tagCount in tagCountList) {
        print('${tagCount.left}: ${tagCount.right}');
      }
      print('----------------\n');
    }
    else {
      throw Exception('Fail to load');
    }
  }
}
