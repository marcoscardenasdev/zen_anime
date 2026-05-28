import 'package:flutter_riverpod/legacy.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/presentation/providers/characters/characters_repository_provider.dart';

final getPopularCharactersProvider =
    StateNotifierProvider<CharactersNotifier, List<Character>>((ref) {
      final getPopularCharacters = ref
          .watch(characterRepositoryProvider)
          .getPopularCharacters;

      return CharactersNotifier(getPopularCharacters: getPopularCharacters);
    });

typedef GetPopularCharactersCallback =
    Future<List<Character>> Function({int page, int limit});

class CharactersNotifier extends StateNotifier<List<Character>> {
  final GetPopularCharactersCallback getPopularCharacters;

  int currentPage = 1;
  bool isLoading = false;
  bool isLastPage = false;
  CharactersNotifier({required this.getPopularCharacters}) : super([]);

  Future<void> fetchMoreCharacters() async {
    if (isLoading || isLastPage) {
      return;
    }

    isLoading = true;
    final characters = await getPopularCharacters(page: currentPage);

    if (characters.isEmpty) {
      isLastPage = true;
      isLoading = false;
      return;
    }

    print('Page: $currentPage');

    state = [...state, ...characters];

    isLoading = false;
    currentPage++;
  }
}
