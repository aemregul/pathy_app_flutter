import 'package:go_router/go_router.dart';
import 'package:pathy_app/ui/views/home_view.dart';
import 'package:pathy_app/ui/views/onboarding_view.dart';
import 'package:pathy_app/ui/views/settings_view.dart';

class AppRouter {
  static const onboardingRoute = '/onboarding';
  static const settingsRoute = '/settings';
  static const homeRoute = '/';

  List<RouteBase> routes = [
    GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
    GoRoute(path: settingsRoute, builder: (context, state) => const SettingsView()),
    GoRoute(
        path: onboardingRoute,
        builder: (context, state) => const OnboardingView()),
  ];
}
