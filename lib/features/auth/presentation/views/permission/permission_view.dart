import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionView extends ConsumerStatefulWidget {
  const PermissionView({super.key});

  @override
  ConsumerState<PermissionView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<PermissionView> {
  bool isCallLogGranted = false;
  bool isCalendarGranted = false;
  bool isLocationGranted = false;
  bool isNotificationGranted = false;

  bool isGranted = false;

  int _currentIndex = 0;
  final List<String> headings = [
    'Allow Notification',
    'Call log Access',
    'Calendar',
    'Location'
  ];
  final descs = [
    'Enable notifications to get personalized, timely tips for stress management and well being directly to your device.',
    "Frequent calls can subtly add stress. By accessing your call log, we'll suggest timely breathing exercises to help you stay calm. It's about your well-being, not monitoring.",
    "Anticipating meetings can sometimes be a source of tension. By accessing your calendar, we'll gently remind you to take a moment to breathe before your upcoming appointments, helping you stay centered.",
    'Travel, hospital visits, or being stuck in traffic can be stressful moments. By knowing your location, we can offer timely breathing exercises to help you navigate these situations with calmness.',
  ];
  final icons = [
    R.images.notificationIcon,
    R.images.callIcon,
    R.images.calendarIcon,
    R.images.locationIcon
  ];

  final images = [
    R.images.notificationPermission,
    R.images.callPermission,
    R.images.calendarAccess,
    R.images.locationAccess,
  ];

  final onChangeText = [
    "Let's start!",
    "Halfway there!",
    "Almost done!",
    "Well done!",
  ];

  void _changePage(bool swipeRight) {
    setState(() {
      if (swipeRight) {
        _currentIndex = (_currentIndex + 1) % headings.length;
      } else {
        _currentIndex = (_currentIndex - 1 + headings.length) % headings.length;
      }

      isGranted = false;
    });
  }

  Future<void> next() async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      if (isGranted) {
        _changePage(true);
      }
    });
  }

  Future<void> requestCallLogPermission() async {
    await Permission.phone.request();
    var status = await Permission.phone.isGranted;

    if (status) {
      setState(() {
        isCallLogGranted = true;
        isGranted = true;
      });
    }

    next();
  }

  Future<void> requestNotificationPermission() async {
    await Permission.notification.request();
    var status = await Permission.notification.isGranted;

    if (status) {
      setState(() {
        isNotificationGranted = true;
        isGranted = true;
      });
    }
    next();
  }

  Future<void> requestCalendarPermission() async {
    await Permission.calendarReadOnly.request();
    var status = await Permission.calendarReadOnly.isGranted;

    if (status) {
      setState(() {
        isCalendarGranted = true;
        isGranted = true;
      });
    }

    next();
  }

  Future<void> requestLocationPermission() async {
    await Permission.location.request();
    var status = await Permission.location.isGranted;

    if (status) {
      setState(() {
        isLocationGranted = true;
        isGranted = true;
      });
    }

    await Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      if (isLocationGranted && isCallLogGranted && isCalendarGranted) {
        GoRouter.of(context).pushReplacement(RoutePaths.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.colors.whiteFDFDFE,
                  R.colors.blue669BE7,
                ],
              ),
            ),
          ),
          Positioned(
            top: 34.h,
            child: Text(
              'Breather',
              style: TextStyle(
                color: R.colors.blue15316F,
                fontSize: 35.27.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 52.h,
            child: Padding(
              padding: EdgeInsets.only(
                top: 33.h,
                left: 30.w,
                right: 30.w,
              ),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isGranted
                        ? Container(
                            height: 154.h,
                            alignment: Alignment.center,
                            child: Text(
                              onChangeText[_currentIndex],
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: R.colors.blue15316F,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.022,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 154.h,
                            child: Image.asset(
                              images[_currentIndex],
                            ),
                          ),
                  ),
                  4.hb,
                  SizedBox(
                    width: 330.h,
                    height: 282.w,
                    child: Card(
                      color: isGranted ? R.colors.blueb6e7e3 : R.colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 24.h,
                          right: 16.w,
                          left: 16.w,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                              backgroundColor: isGranted
                                  ? R.colors.green32B427
                                  : R.colors.blue173776,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: R.colors.white,
                                child: SvgPicture.asset(
                                  icons[_currentIndex],
                                ),
                              ),
                            ),
                            6.hb,
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                headings[_currentIndex],
                                key: ValueKey<int>(_currentIndex),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: R.colors.blue15316F,
                                ),
                              ),
                            ),
                            1.hb,
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: R.colors.grey828384,
                                ),
                                children: [
                                  TextSpan(
                                    text: descs[_currentIndex],
                                    style: TextStyle(
                                      color: const Color(0xFF636363),
                                      fontSize: 12.sp,
                                      letterSpacing: 0.012,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            23.hb,
                            FilledAppButton(
                              text:
                                  isGranted ? 'Access Granted' : 'Grant Access',
                              height: 40.h,
                              width: 296.w,
                              onTap: () {
                                if (isGranted) {
                                  return;
                                }

                                if (_currentIndex == 0) {
                                  requestNotificationPermission();
                                } else if (_currentIndex == 1) {
                                  requestCallLogPermission();
                                } else if (_currentIndex == 2) {
                                  requestCalendarPermission();
                                } else {
                                  requestLocationPermission();
                                }
                              },
                              colors: isGranted
                                  ? [
                                      R.colors.green82EE79,
                                      R.colors.green32B427,
                                    ]
                                  : [
                                      R.colors.blue214D94,
                                      R.colors.blue14306D,
                                    ],
                            ),
                            39.hb,
                            if (!isGranted)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(4, (int index) {
                                  return Container(
                                    margin: EdgeInsets.all(4.r),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == index
                                          ? R.colors.blue14306D
                                          : Colors.grey.shade200,
                                    ),
                                  );
                                }),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  21.hb,
                  if (!isGranted)
                    FilledAppButton(
                      text: 'Continue',
                      onTap: () {
                        if (isLocationGranted &&
                            isCallLogGranted &&
                            isCalendarGranted) {
                          GoRouter.of(context)
                              .pushReplacement(RoutePaths.onboarding);
                        }
                        if (isGranted) {
                          _changePage(true);
                        }
                      },
                      textColor: R.colors.white,
                      height: 40.h,
                      width: 296.w,
                      colors: isGranted
                          ? [
                              R.colors.blue224F96,
                              R.colors.blue132D69,
                            ]
                          : [
                              R.colors.blue224F96.withOpacity(0.4),
                              R.colors.blue132D69.withOpacity(0.6),
                            ],
                    ),
                  22.hb,
                  if (!isGranted)
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(RoutePaths.onboarding);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: R.colors.grey4F4F4F,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
