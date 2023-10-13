import 'package:my_breather_app/features/onboarding/presentation/views/onboarding/onboarding_begin_view.dart';
import 'package:my_breather_app/features/onboarding/presentation/views/onboarding/onboarding_summary_view.dart';
import 'package:my_breather_app/features/onboarding/presentation/views/onboarding/onboarding_test_view.dart';
import 'package:my_breather_app/features/onboarding/presentation/views/welcome/welcome_view.dart';
import 'package:my_breather_app/utils/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: RoutePaths.onboardingBegin,
      builder: (context, state) => const OnboardingBeginView(),
    ),
    GoRoute(
      path: RoutePaths.onboardingTest,
      builder: (context, state) => const OnboardingTestView(),
    ),
    GoRoute(
      path: RoutePaths.onboardingSummary,
      builder: (context, state) => const OnboardingSummaryView(),
    ),
  ],
);
