import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:zen_anime/domain/domain.dart';
import 'widgets.dart';

class AnimesNowHorizontalListview extends ConsumerStatefulWidget {
  final List<Anime> animes;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const AnimesNowHorizontalListview({
    super.key,
    required this.animes,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  AnimesNowHorizontalListviewState createState() =>
      AnimesNowHorizontalListviewState();
}

class AnimesNowHorizontalListviewState
    extends ConsumerState<AnimesNowHorizontalListview> {
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
    return Column(
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
                child: FadeInRight(child: AnimeNowCard(anime: anime)),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AnimeNowCard extends StatelessWidget {
  final Anime anime;
  const AnimeNowCard({super.key, required this.anime});

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
              AnimeImageView(
                imageUrl: anime.imageUrl,
                height: size.width * 0.45,
                width: size.width * 0.38,
              ),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xE69F3967),
                  ),
                  child: Text('Nuevo'),
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
