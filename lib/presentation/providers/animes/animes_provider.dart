import 'package:flutter_riverpod/legacy.dart';

import 'package:zen_anime/domain/domain.dart';
import 'animes_repository_provider.dart';

final getAllAnimesProvider = StateNotifierProvider<AnimesNotifier, List<Anime>>(
  (ref) {
    final fetchAnimes = ref.watch(animesRepositoryProvider).getAllAnimes;

    return AnimesNotifier(fetchAnimes: fetchAnimes);
  },
);

final getNowAnimes = StateNotifierProvider<AnimesNotifier, List<Anime>>((ref) {
  final fetchAnimes = ref.watch(animesRepositoryProvider).getNowAnimes;

  return AnimesNotifier(fetchAnimes: fetchAnimes);
});

final getTopAnimes = StateNotifierProvider<AnimesNotifier, List<Anime>>((ref) {
  final fetchAnimes = ref.watch(animesRepositoryProvider).getTopAnimes;

  return AnimesNotifier(fetchAnimes: fetchAnimes);
});

final getPopularAnimes = StateNotifierProvider<AnimesNotifier, List<Anime>>((
  ref,
) {
  final fetchAnimes = ref.watch(animesRepositoryProvider).getPopularAnimes;

  return AnimesNotifier(fetchAnimes: fetchAnimes);
});

final getUpcomingAnimes = StateNotifierProvider<AnimesNotifier, List<Anime>>((
  ref,
) {
  final fetchAnimes = ref.watch(animesRepositoryProvider).getUpcomingAnimes;

  return AnimesNotifier(fetchAnimes: fetchAnimes);
});

typedef GetAnimesCallback = Future<List<Anime>> Function({int page, int limit});

class AnimesNotifier extends StateNotifier<List<Anime>> {
  final GetAnimesCallback fetchAnimes;

  int currentPage = 1;

  AnimesNotifier({required this.fetchAnimes}) : super([]);

  Future<void> fetchMoreAnimes() async {
    final animes = await fetchAnimes(page: currentPage);

    state = [...state, ...animes];

    currentPage++;
  }
}
