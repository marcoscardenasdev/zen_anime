import 'package:dio/dio.dart';

import 'package:zen_anime/config/config.dart';
import 'package:zen_anime/domain/domain.dart';
import '../mappers/anime_mapper.dart';
import '../models/anime_jikan_response.dart';

class AnimesDatasourceImpl extends AnimesDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  List<Anime> _jsonToAnimes(Map<String, dynamic> json) {
    final response = AnimeJikanResponse.fromJson(json);
    final List<Anime> animes = response.data
        .map((anime) => AnimeMapper.animeResponseToAnime(anime))
        .toList();

    return animes;
  }

  @override
  Future<List<Anime>> getAllAnimes({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      '/anime',
      queryParameters: {'page': page, 'limit': limit},
    );

    final List<Anime> animes = _jsonToAnimes(response.data);

    return animes;
  }

  @override
  Future<Anime> getAnimeById(int id) {
    // TODO: implement getAnimeById
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getNowAnimes({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      '/seasons/now',
      queryParameters: {'page': page, 'limit': limit},
    );

    final List<Anime> animes = _jsonToAnimes(response.data);

    return animes;
  }

  @override
  Future<List<Anime>> getTopAnimes({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      '/top/anime',
      queryParameters: {'page': page, 'limit': limit},
    );

    final List<Anime> animes = _jsonToAnimes(response.data);

    return animes;
  }

  @override
  Future<List<Anime>> getUpcomingAnimes({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      '/seasons/upcoming',
      queryParameters: {'page': page, 'limit': limit},
    );

    final List<Anime> animes = _jsonToAnimes(response.data);

    return animes;
  }

  @override
  Future<List<Anime>> getPopularAnimes({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      '/top/anime',
      queryParameters: {'page': page, 'limit': limit, 'filter': 'bypopularity'},
    );

    final List<Anime> animes = _jsonToAnimes(response.data);

    return animes;
  }
}
