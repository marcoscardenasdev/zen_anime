import 'package:zen_anime/domain/domain.dart';

class AnimesRepositoryImpl extends AnimesRepository {
  final AnimesDatasource _datasource;

  AnimesRepositoryImpl(this._datasource);

  @override
  Future<List<Anime>> getAllAnimes({int page = 1, int limit = 10}) {
    return _datasource.getAllAnimes(page: page, limit: limit);
  }

  @override
  Future<Anime> getAnimeById(int id) {
    return _datasource.getAnimeById(id);
  }

  @override
  Future<List<Anime>> getNowAnimes({int page = 1, int limit = 10}) {
    return _datasource.getNowAnimes(page: page, limit: limit);
  }

  @override
  Future<List<Anime>> getTopAnimes({int page = 1, int limit = 10}) {
    return _datasource.getTopAnimes(page: page, limit: limit);
  }

  @override
  Future<List<Anime>> getUpcomingAnimes({int page = 1, int limit = 10}) {
    return _datasource.getUpcomingAnimes(page: page, limit: limit);
  }

  @override
  Future<List<Anime>> getPopularAnimes({int page = 1, int limit = 10}) {
    return _datasource.getPopularAnimes(page: page, limit: limit);
  }
}
