import 'dart:convert';

import 'package:http/http.dart' as http;

class Tag {
  final String key;
  final bool isMeta;
  final int bojTagId;
  final int problemCount;

  const Tag({
    required this.key,
    required this.isMeta,
    required this.bojTagId,
    required this.problemCount,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'],
      isMeta: json['isMeta'],
      bojTagId: json['bojTagId'],
      problemCount: json['problemCount'],
    );
  }
}

class Problem {
  final int problemId;
  final String titleKo;
  final bool isSolvable;
  final bool isPartial;
  final int acceptedUserCount;
  final int level;
  final int votedUserCount;
  final bool isLevelLocked;
  final num averageTries;
  final List<Tag> tags;

  const Problem({
    required this.problemId,
    required this.titleKo,
    required this.isSolvable,
    required this.isPartial,
    required this.acceptedUserCount,
    required this.level,
    required this.votedUserCount,
    required this.isLevelLocked,
    required this.averageTries,
    required this.tags,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      problemId: json['problemId'],
      titleKo: json['titleKo'],
      isSolvable: json['isSolvable'],
      isPartial: json['isPartial'],
      acceptedUserCount: json['acceptedUserCount'],
      level: json['level'],
      votedUserCount: json['votedUserCount'],
      isLevelLocked: json['isLevelLocked'],
      averageTries: json['averageTries'],
      tags: (json['tags'] as List).map((e) => Tag.fromJson(e)).toList(),
    );
  }
}

class Problems {
  final int count;
  final List<Problem> items;

  const Problems({
    required this.count,
    required this.items,
  });

  factory Problems.fromJson(Map<String, dynamic> json) {
    return Problems(
      count: json['count'],
      items: (json['items'] as List).map((e) => Problem.fromJson(e)).toList(),
    );
  }
}

class Pair {
  Pair(this.left, this.right);

  final String left;
  final int right;
}

Future<Problems> requestClassEssentials(int numClass) async {
  final response = await http.get(
      Uri.parse("https://solved.ac/api/v3/search/problem?query=in_class_essentials:$numClass"));
  final statusCode = response.statusCode;

  if (statusCode == 200) {
    return Problems.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to load');
  }
}

Future<void> main(List<String> arguments) async {
  for (int i = 1; i <= 10; i++) {
    final problems = await requestClassEssentials(i);
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
}
