import 'package:dio/dio.dart';

import 'package:zen_anime/config/config.dart';
import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/infrastructure/mappers/character_mapper.dart';
import 'package:zen_anime/infrastructure/models/characters_jikan_response.dart';

class CharactersDatasourceImpl extends CharactersDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<List<Character>> getPopularCharacters({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await dio.get(
      '/characters',
      queryParameters: {'page': page, 'limit': limit},
    );
    final charactersResponse = CharactersJikanResponse.fromJson(response.data);

    final List<Character> characters = charactersResponse.characters
        .map(
          (character) =>
              CharacterMapper.charactersJikanResponseToCharacter(character),
        )
        .toList();
    return characters;
  }
}
