import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/presentation/providers/user_firestore_provider.dart';
import 'package:breather_app/features/breathing_test/presentation/providers/score_provider.dart';
import 'package:breather_app/features/breathing_test/presentation/providers/streak_provider.dart';
import 'package:breather_app/features/home/domain/models/badge.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class PerformanceTabView extends ConsumerWidget {
  const PerformanceTabView({
    super.key,
    required this.dataMap,
  });

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreAsync = ref.watch(scoreProvider);
    final streakAsync = ref.watch(streakProvider);
    final userAsync = ref.watch(userFirestoreProvider);

    String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

    if (!scoreAsync.hasValue) {
      return const SizedBox();
    }

    if (!userAsync.hasValue) {
      return const SizedBox();
    }

    final score = scoreAsync.value;
    final streak = streakAsync.value;

    final user = userAsync.value;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            "${user?.name ?? 'Your'}'s Daily Activiy",
            style: TextStyle(
              fontSize: 14.sp,
              color: R.colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          22.hb,
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: const [
              Color(0xff4083dd),
              Color(0xff143377),
              Color(0xffBBC7D8),
            ],
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            ringStrokeWidth: 32,
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
          15.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Current Streak: ",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${streak ?? 0}",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              25.wb,
              Row(
                children: [
                  Text(
                    "Completed: ",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    currentDate == (score?.lastUpdated ?? '')
                        ? "${score?.completedExercises ?? 0}"
                        : '0',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          ),
          25.hb,
          Text(
            "Achievement",
            style: TextStyle(
              fontSize: 14.sp,
              color: R.colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          1.hb,
          Text(
            "Total Badges earned: ${user?.badges?.length ?? 0}",
            style: TextStyle(
              fontSize: 10.sp,
              color: R.colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          4.hb,
          Text(
            "Total Score: ${user?.score ?? 0}",
            style: TextStyle(
              fontSize: 10.sp,
              color: R.colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          35.hb,
          Container(
            width: 340.w,
            decoration: BoxDecoration(
              color: R.colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                16.hb,
                Text(
                  "Badges",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF13153F),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                12.hb,
                SizedBox(
                  width: 340.w,
                  height: 265.h,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: GridView.builder(
                      itemCount: PerformanceBadge.values.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.h,
                      ),
                      itemBuilder: (context, index) {
                        bool isEarned = (user?.badges ?? [])
                            .contains(PerformanceBadge.values[index].name);
                        return SizedBox(
                          height: 45.r,
                          width: 45.r,
                          child: isEarned
                              ? Image.asset(
                                  PerformanceBadge.values[index].earnedImg)
                              : Image.asset(
                                  PerformanceBadge.values[index].notEarnedImg),
                        );
                      },
                    ),
                  ),
                ),
                32.hb,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceTile extends ConsumerWidget {
  const PerformanceTile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userFirestoreProvider);

    if (!userAsync.hasValue) {
      return const SizedBox();
    }

    final user = userAsync.value;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: 340.w,
        height: 96.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.7.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFCFDFF6),
              Color(0xFF71A2E8),
            ],
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: R.colors.white,
            radius: 42.r,
            child: Text(
              user?.name.substring(0, 1) ?? '',
              style: TextStyle(
                fontSize: 22.sp,
                color: R.colors.grey4F4F4F,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          title: SizedBox(
            width: 160.w,
            child: Text(
              user?.name ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.black302E2E,
              ),
            ),
          ),
          subtitle: SizedBox(
            width: 160.w,
            child: Text(
              'Level 14',
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w300,
                color: R.colors.black302E2E,
              ),
            ),
          ),
          trailing: Text(
            '${user?.score ?? '0'}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: R.colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
