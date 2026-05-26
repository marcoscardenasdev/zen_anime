import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zen_anime/presentation/providers/providers.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZenAnime'),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: _CharactersView(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _CharactersView extends ConsumerStatefulWidget {
  const _CharactersView();

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends ConsumerState<_CharactersView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(getPopularCharactersProvider.notifier).fetchMoreCharacters();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 600) >=
          scrollController.position.maxScrollExtent) {
        ref.read(getPopularCharactersProvider.notifier).fetchMoreCharacters();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(getPopularCharactersProvider);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personajes Populares'),
          Text(
            'Descubre los personajes de anime mas queridos por los usuarios',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Wrap(
                  children: [
                    ...characters.map(
                      (character) => CharacterCard(character: character),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
