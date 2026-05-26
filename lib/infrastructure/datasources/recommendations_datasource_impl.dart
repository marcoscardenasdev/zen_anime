import 'package:dio/dio.dart';

import 'package:zen_anime/config/config.dart';
import 'package:zen_anime/domain/domain.dart';
import '../mappers/recommendation_mapper.dart';
// import 'package:zen_anime/infrastructure/models/recommendation_jikan_response.dart';

class RecommendationsDatasourceImpl extends RecommendationsDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<List<Recommendation>> getAnimeRecommendations(int id) async {
    final response = await dio.get('/anime/$id/recommendations');

    final List<Recommendation> recommendations = [];

    for (final json in response.data['data']) {
      recommendations.add(
        RecommendationMapper.animeRecommendationsJikanToRecommendation(json),
      );
    }
    return recommendations;
  }
}
