import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/infrastructure/infrastructure.dart';

final animeRecommendationsRepositoryProvider =
    Provider<RecommendationsRepository>((ref) {
      return RecommendationsRepositoryImpl(RecommendationsDatasourceImpl());
    });
