import 'package:go_router/go_router.dart';

import 'package:zen_anime/presentation/screens/screens.dart';

final appRouter = GoRouter(
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
      ],
    ),
  ],
);
