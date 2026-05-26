import 'package:zen_anime/domain/entities/character.dart';

abstract class CharactersDatasource {
  Future<List<Character>> getPopularCharacters({int page = 1, int limit = 10});
}
