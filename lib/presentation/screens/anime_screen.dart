import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:zen_anime/presentation/providers/providers.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class AnimeScreen extends StatelessWidget {
  final int id;
  const AnimeScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.share_outlined)]),
      body: _AnimeView(id: id),
    );
  }
}

class _AnimeView extends ConsumerStatefulWidget {
  final int id;

  const _AnimeView({required this.id});

  @override
  _AnimeViewState createState() => _AnimeViewState();
}

class _AnimeViewState extends ConsumerState<_AnimeView> {
  @override
  void initState() {
    ref.read(getAnimeByIdProvider.notifier).loadAnime(widget.id);
    ref
        .read(getAnimeRecommendationsProvider.notifier)
        .loadRecommendations(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final anime = ref.watch(getAnimeByIdProvider)[widget.id];
    final recomendations = ref.watch(
      getAnimeRecommendationsProvider,
    )[widget.id];
    final size = MediaQuery.of(context).size;
    // TODO: Comprobar si ya se cargo la informacion

    if (anime == null || recomendations == null) {
      return CircularProgressIndicator();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          AnimeImageView(imageUrl: anime.imageUrl),
          Text(anime.title),
          Row(
            children: [
              _CustomContainerDetail(
                icon: Icon(Icons.star),
                title: '${anime.score}',
                subTitle: 'Score',
              ),
              _CustomContainerDetail(
                icon: Icon(Icons.bar_chart),
                title: '${anime.rank}',
                subTitle: 'Ranked',
              ),
              _CustomContainerDetail(
                icon: Icon(Icons.play_circle),
                title: anime.status,
                subTitle: 'Status',
              ),
            ],
          ),

          Text('Synopsis'),
          _Synopsis(synopsis: anime.synopsis),

          // TODO: Personajes
          SizedBox(
            width: double.infinity,
            height: size.height * 0.5,
            child: Column(
              children: [
                CustomTitle(title: 'Recomendaciones'),
                Expanded(
                  child: ListView.builder(
                    itemCount: recomendations.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final recommendation = recomendations[index];
                      return GestureDetector(
                        onTap: () => context.push('anime/${recommendation.id}'),
                        child: AnimeRecommendationCard(
                          recommendation: recommendation,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Recomendaciones
        ],
      ),
    );
  }
}

class _Synopsis extends StatelessWidget {
  final String synopsis;
  const _Synopsis({required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
        border: BoxBorder.all(color: const Color(0xFFDCE3EC)),
      ),
      child: Text(synopsis),
    );
  }
}

class _CustomContainerDetail extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subTitle;
  const _CustomContainerDetail({
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
        border: BoxBorder.all(color: const Color(0xFFDCE3EC)),
      ),
      child: Column(children: [icon, Text(title), Text(subTitle)]),
    );
  }
}
