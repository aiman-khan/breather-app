import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/home/presentation/views/leaderboard/leaderboard_view.dart';
import 'package:breather_app/features/home/presentation/views/performance/performance_view.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:breather_app/utils/router/paths.dart';

import '../performance/widgets/horizontal_calendar.dart';

class ProgressView extends ConsumerStatefulWidget {
  const ProgressView({super.key});

  @override
  ConsumerState<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends ConsumerState<ProgressView> {
  Map<String, double> dataMap = {
    "Mid-day": 2,
    "Morning": 4,
    "Evening": 3,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [1, 0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCFDFF6),
                    Color(0xFF71A2E8),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => GoRouter.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back,
                              color: R.colors.black,
                              size: 28.r,
                            ),
                          ),
                          Text(
                            'Performance',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: R.colors.blue19214C,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(RoutePaths.premium);
                            },
                            child: SizedBox(
                              height: 45.r,
                              width: 45.r,
                              child: SvgPicture.asset(R.images.proIcon),
                            ),
                          )
                        ],
                      ),
                    ),
                    4.hb,
                    Container(
                      padding: EdgeInsets.all(10.r),
                      width: double.infinity,
                      color: const Color(0xFFB8D5FF),
                      child: const DatePickerCustom(),
                    ),
                    15.hb,
                    Expanded(
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          PerformanceTabView(
                            dataMap: dataMap,
                          ),
                          const LeaderboardTabView(),
                        ],
                      ),
                    ),
                    Container(
                      color: R.colors.white,
                      child: TabBar(
                        indicatorPadding:
                            EdgeInsets.symmetric(horizontal: 45.w),
                        indicatorColor: const Color(0xff3F85ED),
                        tabs: [
                          Text(
                            "My Progress",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: R.colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Leaderboard",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: R.colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Days of the week with first letter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              30, // Adjust the number of days as needed
              (index) {
                DateTime currentDate =
                    DateTime.now().add(Duration(days: index));
                bool isToday = DateTime.now().isAtSameMomentAs(currentDate);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Text(
                        isToday
                            ? 'Today'
                            : DateFormat('E').format(
                                DateTime.now().add(Duration(days: index)))[0],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: R.colors.grey828384,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateTime.now()
                            .add(Duration(days: index))
                            .day
                            .toString(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: R.colors.grey828384,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
