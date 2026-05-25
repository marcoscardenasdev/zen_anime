import 'package:flutter/material.dart';

class AnimeImageView extends StatelessWidget {
  final String imageUrl;
  const AnimeImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress != null ? CircularProgressIndicator() : child,
      ),
    );
  }
}
