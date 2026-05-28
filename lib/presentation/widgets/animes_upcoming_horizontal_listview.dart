import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class AnimesUpcomingHorizontalListview extends ConsumerStatefulWidget {
  final List<Anime> animes;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const AnimesUpcomingHorizontalListview({
    super.key,
    required this.animes,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  AnimesUpcomingHorizontalListviewState createState() =>
      AnimesUpcomingHorizontalListviewState();
}

class AnimesUpcomingHorizontalListviewState
    extends ConsumerState<AnimesUpcomingHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 600) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          CustomTitle(title: widget.title, subTitle: widget.subTitle),
          Expanded(
            child: ListView.builder(
              itemCount: widget.animes.length,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final anime = widget.animes[index];
                return GestureDetector(
                  onTap: () => context.push('anime/${anime.id}'),
                  child: FadeInRight(child: AnimeUpcomingCard(anime: anime)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
