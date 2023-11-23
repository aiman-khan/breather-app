import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/home/presentation/views/performance/performance_view.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderboardTabView extends ConsumerWidget {
  const LeaderboardTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Expanded(
            child: Container(
              // height: 480.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: R.colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  12.hb,
                  Text(
                    'Leaderboard',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.hb,
                  Column(
                    children: [
                      PerformanceTile(user: user!),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
