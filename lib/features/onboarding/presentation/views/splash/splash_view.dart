import 'dart:async';
import 'dart:developer';

import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/presentation/providers/user_firestore_provider.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/onboarding/presentation/providers/get_user_provider.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      getUser();
    });
  }

  Future<void> getUser() async {
    user = await ref.read(getUserProvider.future);
    ref.read(userProvider.notifier).setUser(user!);

    await getUserFromFirestore();
  }

  Future<void> getUserFromFirestore() async {
    final firestoreUser = await ref.read(userFirestoreProvider.future);

    if (firestoreUser != null) {
      ref.read(userProvider.notifier).setUser(firestoreUser);
    }

    log('Got User from Firestore as ${firestoreUser?.toJson() ?? 'No user found'}');
  }

  void _navigate() {
    if (!mounted) return;

    if (user != null) {
      GoRouter.of(context).push(RoutePaths.home);
    } else {
      GoRouter.of(context).push(RoutePaths.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.blue112152,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx < 0) {
            _navigate();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              R.images.splashImage,
              fit: BoxFit.cover,
              height: 1.sh,
              width: 1.sw,
            ),
            Positioned(
              top: 37.h,
              child: AppNameWidget(
                color: R.colors.white,
              ),
            ),
            Positioned(
              bottom: 116.h,
              child: Column(
                children: [
                  Text(
                    'Breathe',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: R.colors.blue42C4FB,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Text(
                    'Easy',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: R.colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 47.h,
              child: Row(
                children: [
                  Text(
                    'swipe to start',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: R.colors.white,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: R.colors.white,
                      ),
                      Positioned(
                        left: 8.w,
                        child: Icon(
                          Icons.chevron_left,
                          color: R.colors.white.withOpacity(0.7),
                        ),
                      ),
                      Positioned(
                        left: 16.w,
                        child: Icon(
                          Icons.chevron_left,
                          color: R.colors.white.withOpacity(0.4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
