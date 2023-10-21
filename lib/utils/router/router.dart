import 'package:breather_app/features/auth/presentation/views/forget_password/forget_password_view.dart';
import 'package:breather_app/features/auth/presentation/views/login/login_view.dart';
import 'package:breather_app/features/auth/presentation/views/register/register_view.dart';
import 'package:breather_app/features/home/presentation/views/home/home_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/onboarding_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/welcome/welcome_view.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: RoutePaths.forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
