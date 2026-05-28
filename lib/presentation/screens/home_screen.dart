import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    ref.read(getTopAnimes.notifier).fetchMoreAnimes();
    ref.read(getPopularAnimes.notifier).fetchMoreAnimes();
    scrollController.addListener(() {
      if (isLoading) {
        return;
      }
      if ((scrollController.position.pixels + 600) >=
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        ref.read(getNowAnimes.notifier).fetchMoreAnimes();
        ref.read(getUpcomingAnimes.notifier).fetchMoreAnimes();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return FullScreenLoader(
        messages: [
          'Cargando animes populares',
          'Cargando animes tops',
          'Cargando ...',
          'Espere',
          'Esto esta tardando mas de lo esperado :(',
        ],
      );
    }

    final size = MediaQuery.of(context).size;
    final animesTop = ref.watch(getTopAnimes);
    final animesNow = ref.watch(getNowAnimes);
    //final animesPopular = ref.watch(getPopularAnimes);
    final animesUpcoming = ref.watch(getUpcomingAnimes);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () => context.go('anime/${animesPopular.first.id}'),
            //   child: AnimePopularCard(anime: animesPopular.first),
            // ),
            SizedBox(
              height: size.height * 0.33,
              width: double.infinity,
              child: AnimesTopsHorizontalListview(
                animes: animesTop,
                title: 'Animes Tops',
                subTitle: 'Ver Todos',
                loadNextPage: ref.read(getTopAnimes.notifier).fetchMoreAnimes,
              ),
            ),

            SizedBox(
              height: size.height * 0.33,
              width: double.infinity,
              child: AnimesNowHorizontalListview(
                animes: animesNow,
                title: 'Animes Nuevos',
                subTitle: 'Ver Todos',
                loadNextPage: ref.read(getNowAnimes.notifier).fetchMoreAnimes,
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
              width: double.infinity,
              child: AnimesUpcomingHorizontalListview(
                animes: animesUpcoming,
                title: 'Proximos',
                subTitle: 'Ver Todos',
                loadNextPage: ref
                    .read(getUpcomingAnimes.notifier)
                    .fetchMoreAnimes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
