import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/auth/presentation/views/enable_disable_permission/widgets/permission_tile.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class EnableDisablePermissionView extends ConsumerStatefulWidget {
  const EnableDisablePermissionView({super.key});

  @override
  ConsumerState<EnableDisablePermissionView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<EnableDisablePermissionView> {
  bool positive = false;

  bool isCallGranted = false;
  bool isCalendarEnabled = false;
  bool isNotificationEnabled = false;
  bool isLocationEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async {
    isCallGranted = await Permission.phone.isGranted;
    isNotificationEnabled = await Permission.notification.isGranted;
    isCalendarEnabled = await Permission.calendarReadOnly.isGranted;
    isLocationEnabled = await Permission.location.isGranted;

    setState(() {});
  }

  _toggleNotificationPermission() async {
    if (!isNotificationEnabled) {
      await Permission.notification.request();
    }

    setState(() {
      isNotificationEnabled = true;
    });
  }

  _toggleLocationPermission() async {
    if (!isLocationEnabled) {
      await Permission.location.request();
    }

    setState(() {
      isLocationEnabled = true;
    });
  }

  _toggleCalendarPermission() async {
    if (!isCalendarEnabled) {
      await Permission.calendarReadOnly.request();
    }

    setState(() {
      isCalendarEnabled = true;
    });
  }

  _toggleCallPermission() async {
    if (!isCallGranted) {
      await Permission.phone.request();
    }

    setState(() {
      isCallGranted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF5596DC),
                  Color(0xFF12448D),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 33.h),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      color: R.colors.white,
                    ),
                    Text(
                      'Permissions',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: R.colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 33.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        children: [
                          31.hb,
                          PermissionTile(
                            icon: R.images.notificationIcon,
                            title: 'Notifications',
                            onTap: _toggleNotificationPermission,
                            isEnabled: isNotificationEnabled,
                            description:
                                'Enable notifications to get personalized, timely tips for stress management and well being directly to your device.',
                          ),
                          12.hb,
                          PermissionTile(
                            icon: R.images.callIcon,
                            title: 'Call Logs',
                            onTap: _toggleCallPermission,
                            isEnabled: isCallGranted,
                            description:
                                'This allows us to provide immediate, customized breathing exercises post-call to help you unwind and maintain your peace of mind.',
                          ),
                          12.hb,
                          PermissionTile(
                            icon: R.images.locationIcon,
                            title: 'Location',
                            onTap: _toggleLocationPermission,
                            isEnabled: isLocationEnabled,
                            description:
                                'Connect your calendar for customized reminders to breathe and relax before big days and key meetings.',
                          ),
                          12.hb,
                          PermissionTile(
                            icon: R.images.calendarIcon,
                            title: 'Calendar',
                            onTap: _toggleNotificationPermission,
                            isEnabled: isNotificationEnabled,
                            description:
                                'By syncing with your calendar, we can timely suggest breathing practices to help you prepare for and decompress from significant events.',
                          ),
                          12.hb,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
