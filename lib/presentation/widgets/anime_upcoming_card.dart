import 'package:flutter/material.dart';
import 'package:zen_anime/domain/domain.dart';
import '../widgets/widgets.dart';

class AnimeUpcomingCard extends StatelessWidget {
  final Anime anime;
  const AnimeUpcomingCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.38,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          AnimeImageView(imageUrl: anime.imageUrl),
          _Animeinfo(anime: anime),
        ],
      ),
    );
  }
}

class _Animeinfo extends StatelessWidget {
  final Anime anime;
  const _Animeinfo({required this.anime});

  @override
  Widget build(BuildContext context) {
    final premiere = anime.premiere.split('to').first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(anime.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        Text(premiere),
      ],
    );
  }
}
