import 'package:go_router/go_router.dart';
import 'package:my_tree_links/screens/profile.dart';

import '../screens/home_page.dart';

class AppRouteConstants {
  static const String homeRouteName = 'home';
  static const String profileRouteName = 'profile';
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AppRouteConstants.profileRouteName,
      path: '/profile',
      builder: (context, state) => const Profile(
          // appUser: null,
          ),
    ),
  ],
);
