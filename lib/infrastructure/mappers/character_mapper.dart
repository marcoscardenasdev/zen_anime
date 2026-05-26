import 'package:zen_anime/domain/domain.dart';
import '../models/characters_jikan_response.dart';

abstract class CharacterMapper {
  static Character charactersJikanResponseToCharacter(
    CharacterResponse charactersResponse,
  ) => Character(
    id: charactersResponse.malId,
    imageUrl: charactersResponse.images.jpg.imageUrl,
    name: charactersResponse.name,
    about: charactersResponse.about,
    favorites: charactersResponse.favorites,
  );
}
