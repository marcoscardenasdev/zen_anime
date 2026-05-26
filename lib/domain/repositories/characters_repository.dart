import 'package:zen_anime/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getPopularCharacters({int page = 1, int limit = 10});
}
