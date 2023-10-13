import 'package:my_breather_app/features/onboarding/presentation/views/welcome/welcome_view.dart';
import 'package:my_breather_app/utils/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
  ],
);
