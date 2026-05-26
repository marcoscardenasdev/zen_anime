import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/presentation/providers/providers.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: null, icon: const Icon(Icons.menu)),
        title: const Text('ZenAnime'),
        centerTitle: true,
      ),
      body: _HomeView(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    ref.read(getTopAnimes.notifier).fetchMoreAnimes();
    ref.read(getNowAnimes.notifier).fetchMoreAnimes();
    ref.read(getUpcomingAnimes.notifier).fetchMoreAnimes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animesTop = ref.watch(getTopAnimes);
    final animesNow = ref.watch(getNowAnimes);
    final animesUpcoming = ref.watch(getUpcomingAnimes);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            width: double.infinity,
            child: AnimesTopsHorizontalListview(
              animes: animesTop,
              title: 'Animes Tops',
              subTitle: 'Ver Todos',
            ),
          ),

          SizedBox(
            height: size.height * 0.33,
            width: double.infinity,
            child: AnimesNowHorizontalListview(
              animes: animesNow,
              title: 'Animes Nuevos',
              subTitle: 'Ver Todos',
            ),
          ),
          SizedBox(
            height: size.height * 0.35,
            width: double.infinity,
            child: AnimesUpcomingHorizontalListview(
              animes: animesUpcoming,
              title: 'Proximos',
              subTitle: 'Ver Todos',
            ),
          ),
        ],
      ),
    );
  }
}

class AnimesTopsHorizontalListview extends StatelessWidget {
  final List<Anime> animes;
  final String? title;
  final String? subTitle;
  const AnimesTopsHorizontalListview({
    super.key,
    required this.animes,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
          title: title,
          subTitle: subTitle,
          onPressed: () => context.push('animes-top'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: animes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final anime = animes[index];
              return GestureDetector(
                onTap: () => context.push('/anime/${anime.id}'),
                child: FadeInRight(child: AnimeTopCard(anime: anime)),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AnimesNowHorizontalListview extends StatelessWidget {
  final List<Anime> animes;
  final String? title;
  final String? subTitle;
  const AnimesNowHorizontalListview({
    super.key,
    required this.animes,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
          title: title,
          subTitle: subTitle,
          onPressed: () => context.push('animes-now'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: animes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final anime = animes[index];
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

class AnimesUpcomingHorizontalListview extends StatelessWidget {
  final List<Anime> animes;
  final String? title;
  final String? subTitle;
  const AnimesUpcomingHorizontalListview({
    super.key,
    required this.animes,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          CustomTitle(
            title: title,
            subTitle: subTitle,
            onPressed: () => context.push('animes-upcoming'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: animes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final anime = animes[index];
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
