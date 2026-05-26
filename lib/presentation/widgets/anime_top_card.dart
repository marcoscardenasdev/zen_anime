import 'package:flutter/material.dart';

import 'package:zen_anime/domain/domain.dart';
import '../widgets/anime_image_view.dart';

class AnimeTopCard extends StatelessWidget {
  final Anime anime;
  const AnimeTopCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.38,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(left: 14, right: 16, bottom: 8),
      child: Column(
        spacing: 2,
        children: [
          Stack(
            children: [
              AnimeImageView(imageUrl: anime.imageUrl),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xE6FFFFFF),
                  ),
                  width: 70,
                  child: Row(
                    children: [Icon(Icons.star), Text('${anime.score}')],
                  ),
                ),
              ),
            ],
          ),
          _AnimeInfo(anime: anime),
        ],
      ),
    );
  }
}

class _AnimeInfo extends StatelessWidget {
  final Anime anime;
  const _AnimeInfo({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(anime.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        Row(
          spacing: 5,
          children: [Text(anime.type), Text('${anime.episodes} eps')],
        ),
      ],
    );
  }
}
