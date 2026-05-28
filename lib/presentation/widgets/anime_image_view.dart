import 'package:flutter/material.dart';

class AnimeImageView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const AnimeImageView({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress != null
            ? SizedBox(
                height: height,
                width: width,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              )
            : child,
      ),
    );
  }
}
