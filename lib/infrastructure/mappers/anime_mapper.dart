import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/infrastructure/models/anime_jikan_details_response.dart';

import '../models/anime_jikan_response.dart';

const KEY_IMAGE = 'jpg';

abstract class AnimeMapper {
  static Anime animeResponseToAnime(AnimeResponse response) => Anime(
    id: response.malId,
    imageUrl: response.images[KEY_IMAGE]!.largeImageUrl,
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

  static Anime animeDetailsToAnime(AnimeDetailsResponse animeDetails) => Anime(
    id: animeDetails.malId,
    imageUrl: animeDetails.images[KEY_IMAGE]!.largeImageUrl,
    title: animeDetails.title,
    type: animeDetails.type,
    episodes: animeDetails.episodes,
    status: animeDetails.status,
    score: animeDetails.score,
    scoredBy: animeDetails.scoredBy,
    rank: animeDetails.rank,
    synopsis: animeDetails.synopsis,
    background: animeDetails.background,
    genres: List<String>.from(animeDetails.genres.map((genre) => genre.name)),
    members: animeDetails.members,
    premiere: animeDetails.aired.string,
  );
}
