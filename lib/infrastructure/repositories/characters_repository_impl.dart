import 'package:zen_anime/domain/domain.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CharactersDatasource datasource;

  CharactersRepositoryImpl(this.datasource);
  @override
  Future<List<Character>> getPopularCharacters({int page = 1, int limit = 10}) {
    return datasource.getPopularCharacters(page: page, limit: limit);
  }
}
