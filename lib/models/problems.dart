import 'package:class_parsing/models/problem.dart';

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
