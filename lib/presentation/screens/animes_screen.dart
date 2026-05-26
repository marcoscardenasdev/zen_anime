import 'package:flutter/material.dart';

import 'package:zen_anime/presentation/widgets/widgets.dart';

class AnimesScreen extends StatelessWidget {
  const AnimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Pantalla de animes')),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
