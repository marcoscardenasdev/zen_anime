import 'package:flutter/material.dart';

import 'package:zen_anime/domain/domain.dart';
import '../widgets/anime_image_view.dart';

class AnimeRecommendationCard extends StatelessWidget {
  final Recommendation recommendation;
  const AnimeRecommendationCard({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      //height: size.height * 0.5,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          AnimeImageView(
            imageUrl: recommendation.imageUrl,
            width: size.width * 0.4,
            height: size.height * 0.25,
          ),
          Text(recommendation.title),
        ],
      ),
    );
  }
}
