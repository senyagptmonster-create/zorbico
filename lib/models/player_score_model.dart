class PlayerScoreItem {
  final String id;
  final String name;
  int score;

  PlayerScoreItem({
    required this.id,
    required this.name,
    this.score = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'score': score,
  };

  factory PlayerScoreItem.fromJson(Map<String, dynamic> m) => PlayerScoreItem(
    id: m['id'] as String,
    name: m['name'] as String,
    score: m['score'] as int? ?? 0,
  );
}
