import 'package:flutter/material.dart';
import 'package:zen_anime/config/config.dart';
import 'package:zen_anime/domain/domain.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      width: size.width * 0.4,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            character.imageUrl,
            height: size.height * 0.25,
            width: size.width * 0.9,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress != null ? CircularProgressIndicator() : child,
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.favorite_border),
                    Text(HumanFormats.number(character.favorites)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
