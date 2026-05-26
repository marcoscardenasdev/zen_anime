import 'package:zen_anime/domain/domain.dart';

const String KEY_IMAGES = 'jpg';

abstract class RecommendationMapper {
  static Recommendation animeRecommendationsJikanToRecommendation(
    Map<String, dynamic> json,
  ) => Recommendation(
    id: json['entry']['mal_id'],
    imageUrl: json['entry']['images'][KEY_IMAGES]['large_image_url'],
    title: json['entry']['title'],
  );
}
