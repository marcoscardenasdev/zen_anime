import 'package:zen_anime/domain/domain.dart';

import '../models/anime_jikan_response.dart';

abstract class AnimeMapper {
  static Anime animeResponseToAnime(AnimeResponse response) => Anime(
    id: response.malId,
    imageUrl: response.images['jpg']!.largeImageUrl,
    title: response.title,
    type: response.type,
    episodes: response.episodes,
    status: response.status,
    score: response.score,
    scoredBy: response.scoredBy,
    rank: response.rank,
    synopsis: response.synopsis,
    genres: List<String>.from(
      response.genres.map((genre) => genre.name).toList(),
    ),
    members: response.members,
    background: response.background,
    premiere: response.aired.string,
  );
}
