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

      child: AnimeImageView(
        imageUrl: anime.imageUrl,
        height: size.height * 0.4,
        width: double.infinity,
      ),
    );
  }
}

// class _CustomGradient extends StatelessWidget {
//   final List<double> stops;
//   final List<Color> colors;
//   final Alignment begin;
//   final Alignment end;
//   const _CustomGradient({
//     required this.begin,
//     required this.end,
//     this.colors = const [Colors.red, Colors.blue],
//     this.stops = const [0.0, 0.5],
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           stops: stops,
//           begin: begin,
//           end: end,
//         ),
//       ),
//     );
//   }
// }
