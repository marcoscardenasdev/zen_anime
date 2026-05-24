class Anime {
  final int id;
  final String imageUrl;
  final String title;
  final String type;
  final int episodes;
  final String status;
  final double score;
  final int scoredBy;
  final int rank;
  final String synopsis;
  final String background;
  final List<String> genres;
  final int members;

  Anime({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.episodes,
    required this.status,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.synopsis,
    required this.background,
    required this.genres,
    required this.members,
  });
}
