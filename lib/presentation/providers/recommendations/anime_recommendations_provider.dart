import 'package:flutter_riverpod/legacy.dart';

import 'package:zen_anime/domain/domain.dart';
import '../recommendations/anime_recommendations_repository_provider.dart';

final getAnimeRecommendationsProvider =
    StateNotifierProvider<
      AnimeRecommendationsNotifier,
      Map<int, List<Recommendation>>
    >((ref) {
      final getAnimeRecommendations = ref
          .watch(animeRecommendationsRepositoryProvider)
          .getAnimeRecommendation;
      return AnimeRecommendationsNotifier(
        getAnimeRecommendations: getAnimeRecommendations,
      );
    });

typedef GetAnimeRecommendationsCallback =
    Future<List<Recommendation>> Function(int id);

class AnimeRecommendationsNotifier
    extends StateNotifier<Map<int, List<Recommendation>>> {
  final GetAnimeRecommendationsCallback getAnimeRecommendations;

  AnimeRecommendationsNotifier({required this.getAnimeRecommendations})
    : super({});

  Future<void> loadRecommendations(int id) async {
    if (state[id] != null) {
      return;
    }

    final recommendations = await getAnimeRecommendations(id);

    state = {...state, id: recommendations};
  }
}
