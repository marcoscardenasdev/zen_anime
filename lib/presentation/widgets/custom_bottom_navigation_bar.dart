import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouter.of(context).state.path;

    if (location == '/') {
      return 0;
    } else if (location == 'animes') {
      return 1;
    } else if (location == 'characters') {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      onTap: (value) {
        switch (value) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('animes');
            break;
          case 2:
            context.go('characters');
            break;
        }
      },
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_2),
          label: 'Characters',
        ),
      ],
    );
  }
}
