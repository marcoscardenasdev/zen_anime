import 'package:flutter_riverpod/legacy.dart';
import 'package:zen_anime/domain/domain.dart';
import '../providers.dart';

final getAnimeByIdProvider =
    StateNotifierProvider<AnimeNotifier, Map<int, Anime>>((ref) {
      final getAnimeByIdCallback = ref
          .watch(animesRepositoryProvider)
          .getAnimeById;

      return AnimeNotifier(getAnimeByIdCallback: getAnimeByIdCallback);
    });

typedef GetAnimeByIdCallback = Future<Anime> Function(int id);

class AnimeNotifier extends StateNotifier<Map<int, Anime>> {
  final GetAnimeByIdCallback getAnimeByIdCallback;
  AnimeNotifier({required this.getAnimeByIdCallback}) : super({});

  Future<void> loadAnime(int id) async {
    if (state[id] != null) {
      return;
    }

    final anime = await getAnimeByIdCallback(id);

    state = {...state, id: anime};
  }
}
