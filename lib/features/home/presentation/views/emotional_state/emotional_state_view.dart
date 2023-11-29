import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/breathing_test/morning_view.dart';
import 'package:breather_app/features/home/domain/models/breathing_pattern.dart';
import 'package:breather_app/features/home/presentation/views/emotional_state/widgets/emotional_state_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/router/paths.dart';

class EmotionalStateView extends StatelessWidget {
  const EmotionalStateView({
    super.key,
    required this.patterns,
    required this.title,
  });

  final List<BreathingPattern> patterns;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: R.colors.blue13285B,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.colors.blue5082BF,
                  R.colors.blue13285B,
                  R.colors.blue0E0A30,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 31.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: R.colors.white,
                          size: 28.r,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.premium);
                        },
                        child: SizedBox(
                          height: 50.r,
                          width: 50.r,
                          child: SvgPicture.asset(R.images.proIcon),
                        ),
                      )
                    ],
                  ),
                  24.hb,
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 35.27.sp,
                      color: R.colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.hb,
                  Icon(
                    Icons.star,
                    color: R.colors.white,
                    size: 14.r,
                  ),
                  41.hb,
                  Text(
                    'Choose your streak',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: R.colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  32.hb,
                  EmotionalStateWidget(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MorningView(
                          pattern: patterns[0],
                          patternName: title,
                        );
                      }));
                    },
                    colors: [
                      R.colors.white,
                      R.colors.whiteC3C3C3,
                    ],
                    textColor: R.colors.blue112152,
                    title: patterns[0].title,
                  ),
                  20.48.hb,
                  EmotionalStateWidget(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MorningView(
                          pattern: patterns[1],
                          patternName: title,
                        );
                      }));
                    },
                    colors: const [
                      Color(0xFF62B1FF),
                      Color(0xFF3371C5),
                    ],
                    title: patterns[1].title,
                  ),
                  20.48.hb,
                  EmotionalStateWidget(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MorningView(
                          pattern: patterns[2],
                          patternName: title,
                        );
                      }));
                    },
                    colors: const [
                      Color(0xFF366FC8),
                      Color(0xFF1E3A7B),
                    ],
                    title: patterns[2].title,
                  ),
                  20.48.hb,
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(R.images.scheduleIcon),
                            2.hb,
                            Text(
                              'Scheduler',
                              style: TextStyle(
                                color: R.colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(R.images.homeIcon),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.progress);
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(R.images.progressIcon),
                            2.hb,
                            Text(
                              'Progress',
                              style: TextStyle(
                                color: R.colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
