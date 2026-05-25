import 'package:flutter/material.dart';

class AnimeScreen extends StatelessWidget {
  final int id;
  const AnimeScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.share_outlined)]),
      body: Center(child: Text('$id')),
    );
  }
}
