import 'package:go_router/go_router.dart';
import 'package:zen_anime/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const HomeScreen())],
);
