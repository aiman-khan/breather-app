import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:breather_app/helpers/local_notification/local_notification.dart';
import 'package:breather_app/helpers/persistence/persistence_helper.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/extensions/num.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await sl<PersistenceHelper>().init();

  await Firebase.initializeApp();

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //Add device pixel ratio here
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const ProviderApp();
      },
    );
  }
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setPadding(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: R.colors.white,
        ),
        routerConfig: router,
      ),
    );
  }
}
