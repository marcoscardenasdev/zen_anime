import 'package:zen_anime/domain/domain.dart';

abstract class RecommendationsDatasource {
  Future<List<Recommendation>> getAnimeRecommendations(int id);
}
