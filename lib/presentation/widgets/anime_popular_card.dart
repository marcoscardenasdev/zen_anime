import 'package:flutter/material.dart';

import 'package:zen_anime/domain/domain.dart';
import 'package:zen_anime/presentation/widgets/widgets.dart';

class AnimePopularCard extends StatelessWidget {
  final Anime anime;
  const AnimePopularCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),

      child: Stack(
        children: [
          AnimeImageView(
            imageUrl: anime.imageUrl,
            height: size.height * 0.4,
            width: double.infinity,
          ),
          const _CustomGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0x00243138), Color(0x4D243138), Color(0xE6243138)],
            stops: [0.0, 0.5, 1],
          ),
          // Column(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4),
          //         color: Color(0xAA2C50CD),
          //       ),
          //       child: Text('MAS POPULAR'),
          //     ),
          //     Text(anime.title, maxLines: 1),
          //     Text(
          //       anime.background,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //     ),
          //     // TODO: Boton
          //     FilledButton.icon(
          //       onPressed: null,
          //       icon: Icon(Icons.play_circle_outline),
          //       label: Text('Ver Detalles'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final List<double> stops;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  const _CustomGradient({
    required this.begin,
    required this.end,
    this.colors = const [Colors.red, Colors.blue],
    this.stops = const [0.0, 0.5],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          stops: stops,
          begin: begin,
          end: end,
        ),
      ),
    );
  }
}
