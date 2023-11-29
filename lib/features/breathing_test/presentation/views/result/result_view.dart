import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFAFBFD),
                  Color(0xFF6D9FE7),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 59.w),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    60.hb,
                    const AppNameWidget(),
                    133.hb,
                    Text(
                      'Superb!',
                      style: TextStyle(
                        color: R.colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    27.hb,
                    Text(
                      'Well done! Your breathing test is complete. Every step you take brings you closer to understanding your lung capacity and health.',
                      style: TextStyle(
                        color: const Color(0xFF676767),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    104.hb,
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(RoutePaths.home);
                      },
                      child: Container(
                        height: 42.h,
                        width: 135.w,
                        alignment: Alignment.center,
                        constraints: BoxConstraints(minWidth: 135.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                R.colors.blue224F96,
                                R.colors.blue132D69,
                              ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              size: 24.r,
                              color: R.colors.white,
                            ),
                            14.wb,
                            Text(
                              'Done',
                              style: TextStyle(
                                color: R.colors.white,
                                fontSize: 13.22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    80.hb,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
