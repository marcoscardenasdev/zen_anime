import 'package:zen_anime/domain/domain.dart';

abstract class RecommendationsRepository {
  Future<List<Recommendation>> getAnimeRecommendation(int id);
}
