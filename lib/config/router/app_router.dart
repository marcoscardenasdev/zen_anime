import 'package:go_router/go_router.dart';

import 'package:zen_anime/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'anime/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return AnimeScreen(id: id);
          },
        ),
        GoRoute(
          path: 'characters',
          builder: (context, state) => CharactersScreen(),
        ),
        GoRoute(path: 'animes', builder: (context, state) => AnimesScreen()),
        GoRoute(
          path: 'animes-top',
          builder: (context, state) => AnimesTopScreen(),
        ),
        GoRoute(
          path: 'animes-now',
          builder: (context, state) => AnimesNowScreen(),
        ),
        GoRoute(
          path: 'animes-upcoming',
          builder: (context, state) => AnimesUpcomingScreen(),
        ),
      ],
    ),
  ],
);
