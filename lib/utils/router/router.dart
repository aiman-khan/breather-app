import 'package:breather_app/features/auth/presentation/views/enable_disable_permission/enable_disable_permission_view.dart';
import 'package:breather_app/features/auth/presentation/views/forget_password/forget_password_view.dart';
import 'package:breather_app/features/auth/presentation/views/interest_selection/interest_selection_view.dart';
import 'package:breather_app/features/auth/presentation/views/login/login_view.dart';
import 'package:breather_app/features/auth/presentation/views/permission/permission_view.dart';
import 'package:breather_app/features/auth/presentation/views/register/register_view.dart';
import 'package:breather_app/features/breathing_test/presentation/views/result/result_view.dart';
import 'package:breather_app/features/home/presentation/views/progress/progress_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/splash/splash_view.dart';
import 'package:breather_app/features/home/presentation/views/home/home_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/onboarding/onboarding_view.dart';
import 'package:breather_app/features/onboarding/presentation/views/welcome/welcome_view.dart';
import 'package:breather_app/features/schedular/presentation/views/session_schedular/session_schedular_session.dart';
import 'package:breather_app/features/schedular/presentation/views/set_timer/set_timer_view.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/premium/presentation/views/premium/premium_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.welcome,
      builder: (context, state) => const WelcomeView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const WelcomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) => const OnboardingView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const OnboardingView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.register,
      builder: (context, state) => const RegisterView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const RegisterView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const ForgetPasswordView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.interestSelection,
      builder: (context, state) => const InterestSelectionView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const InterestSelectionView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.permission,
      builder: (context, state) => const PermissionView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const PermissionView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.premium,
      builder: (context, state) => const PremiumView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const PremiumView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0, 1);
          const end = Offset.zero;
          return SlideTransition(
            position: Tween(begin: begin, end: end).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: RoutePaths.result,
      builder: (context, state) => const ResultView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const ResultView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.progress,
      builder: (context, state) => const ProgressView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const ProgressView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.enableDisablePermissions,
      builder: (context, state) => const EnableDisablePermissionView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const EnableDisablePermissionView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.sessionSchedular,
      builder: (context, state) => const SessionSchedularView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const SessionSchedularView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: RoutePaths.setTimer,
      builder: (context, state) => const SetTimerView(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          key: state.pageKey,
          child: const SetTimerView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
