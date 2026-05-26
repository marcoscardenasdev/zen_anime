import 'package:zen_anime/domain/domain.dart';

class RecommendationsRepositoryImpl extends RecommendationsRepository {
  final RecommendationsDatasource datasource;

  RecommendationsRepositoryImpl(this.datasource);
  @override
  Future<List<Recommendation>> getAnimeRecommendation(int id) {
    return datasource.getAnimeRecommendations(id);
  }
}
