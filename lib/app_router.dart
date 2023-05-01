import 'package:flaru/screens/explorer_screen.dart';
import 'package:flaru/screens/player_screen.dart';
import 'package:go_router/go_router.dart';

enum RouteNames { explorer, player }

class AppRouter {
  static final router = GoRouter(initialLocation: '/${RouteNames.explorer.name}', observers: [], routes: [
    GoRoute(
      name: RouteNames.explorer.name,
      path: '/${RouteNames.explorer.name}',
      builder: (context, state) => const ExplorerScreen(),
    ),
    GoRoute(
      name: RouteNames.player.name,
      path: '/${RouteNames.player.name}',
      builder: (context, state) => PlayerScreen(swfFilePath: state.queryParameters['path']!),
    ),
  ]);
}
