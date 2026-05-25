import '../entities/anime.dart';

abstract class AnimesRepository {
  Future<List<Anime>> getAllAnimes({int page = 1, int limit = 10});
  Future<List<Anime>> getTopAnimes({int page = 1, int limit = 10});
  Future<List<Anime>> getPopularAnimes({int page = 1, int limit = 10});
  Future<List<Anime>> getNowAnimes({int page = 1, int limit = 10});
  Future<List<Anime>> getUpcomingAnimes({int page = 1, int limit = 10});
  Future<Anime> getAnimeById(int id);
}
