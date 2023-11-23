import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/presentation/providers/user_firestore_provider.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/home/domain/models/emotional_state.dart';
import 'package:breather_app/features/home/presentation/views/emotional_state/emotional_state_view.dart';
import 'package:breather_app/features/home/presentation/views/emotional_state/widgets/emotional_state_widget.dart';
import 'package:breather_app/features/home/presentation/views/home/widgets/drawer_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/router/paths.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userFirestoreProvider);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        drawer: const DrawerWidget(),
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
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Icon(
                              Icons.more_vert,
                              color: R.colors.white,
                              size: 28.r,
                            ),
                          );
                        }),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .push(RoutePaths.enableDisablePermissions);
                          },
                          child: SizedBox(
                            height: 25.r,
                            width: 25.r,
                            child: SvgPicture.asset(R.images.lockIcon),
                          ),
                        ),
                        6.wb,
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
                    24.hb,
                    AppNameWidget(
                      color: R.colors.white,
                    ),
                    8.hb,
                    Icon(
                      Icons.star,
                      color: R.colors.white,
                      size: 14.r,
                    ),
                    41.hb,
                    Text(
                      'what are you feeling?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: R.colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    32.hb,
                    Column(
                      children: List.generate(
                        EmotionalState.values.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 20.48.h),
                          child: EmotionalStateWidget(
                            colors: EmotionalState.values[index].colors,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EmotionalStateView(
                                      patterns:
                                          EmotionalState.values[index].pattern,
                                      title: EmotionalState.values[index].name,
                                    );
                                  },
                                ),
                              );
                            },
                            title: EmotionalState.values[index].name,
                            textColor: index == 0 ? R.colors.blue112152 : null,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!userAsync.hasValue) {
                              showLoginActionDialog(context);
                            }
                          },
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
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(R.images.homeIcon),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (userAsync.value == null) {
                              showLoginActionDialog(context);
                            } else if (!userAsync.hasValue) {
                              showLoginActionDialog(context);
                            } else {
                              GoRouter.of(context).push(RoutePaths.progress);
                            }
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
      ),
    );
  }

  Future<dynamic> showLoginActionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Action Required',
          ),
          content: Text(
            'You need to login first',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          actions: [
            FilledAppButton(
              text: 'OK',
              onTap: () => GoRouter.of(context).pop(),
              height: 32.h,
              width: 80.w,
            )
          ],
        );
      },
    );
  }
}
