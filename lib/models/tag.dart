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
