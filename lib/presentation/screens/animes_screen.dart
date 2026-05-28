import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/presentation/providers/providers.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class AnimesScreen extends StatelessWidget {
  const AnimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZenAnime'),
        centerTitle: true,
        leading: IconButton(onPressed: null, icon: Icon(Icons.menu)),
      ),
      body: _AnimesView(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _AnimesView extends ConsumerStatefulWidget {
  const _AnimesView();

  @override
  _AnimesViewState createState() => _AnimesViewState();
}

class _AnimesViewState extends ConsumerState<_AnimesView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(getAllAnimesProvider.notifier).fetchMoreAnimes();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 600) >=
          scrollController.position.maxScrollExtent) {
        ref.read(getAllAnimesProvider.notifier).fetchMoreAnimes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final animes = ref.watch(getAllAnimesProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          controller: scrollController,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Wrap(
              children: [...animes.map((anime) => _AnimeCard(anime: anime))],
            );
          },
        ),
      ),
    );
  }
}

class _AnimeCard extends StatelessWidget {
  final Anime anime;
  const _AnimeCard({required this.anime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.38,
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AnimeImageView(imageUrl: anime.imageUrl),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Container(
                  width: size.width * 0.15,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xAAFFFFFF),
                  ),
                  child: Row(
                    children: [Icon(Icons.star), Text('${anime.score}')],
                  ),
                ),
              ),
            ],
          ),
          Text(anime.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          Row(
            spacing: 5,
            children: [Text(anime.type), Text('${anime.episodes} eps')],
          ),
        ],
      ),
    );
  }
}
