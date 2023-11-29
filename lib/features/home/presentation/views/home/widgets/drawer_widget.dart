import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/features/auth/presentation/providers/remove_user_provider.dart';
import 'package:breather_app/features/auth/presentation/providers/user_firestore_provider.dart';
import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/utils/loading/loading.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:breather_app/utils/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({
    super.key,
  });

  Future<void> _logout(WidgetRef ref, BuildContext context) async {
    try {
      loading(context);
      await ref.read(removeUserProvider.future);
      if (context.mounted) {
        GoRouter.of(context).go(RoutePaths.login);
      }
      ref.read(userProvider.notifier).clear();
    } catch (e) {
      showToast('Error logging out');
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userFirestoreProvider);

    if (!userAsync.hasValue) {
      return const SizedBox();
    }

    final user = userAsync.value;

    return Drawer(
      backgroundColor: R.colors.blue13285B,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 81.h,
          horizontal: 31.w,
        ),
        child: Column(
          children: [
            if (user != null) ...[
              CircleAvatar(
                backgroundColor: R.colors.white,
                radius: 36.r,
                child: Text(
                  user.name.substring(0, 1),
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: R.colors.blue112152,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              4.hb,
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: R.colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              2.hb,
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 7.5.sp,
                  color: R.colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            39.hb,
            DrawerItem(
              title: 'Lungs Test',
              icon: R.images.lungsIcon,
              onTap: () {
                GoRouter.of(context).push(RoutePaths.onboarding);
              },
            ),
            DrawerItem(
              title: 'Privacy Policy',
              icon: R.images.privacyPolicyIcon,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Contact Us',
              icon: R.images.contactIcon,
              onTap: () {},
            ),
            DrawerItem(
              title: 'More Apps',
              icon: R.images.moreAppsIcon,
              onTap: () {},
            ),
            DrawerItem(
              title: 'About',
              icon: R.images.aboutDrawerIcon,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Help & FAQs',
              icon: R.images.faqsIcon,
              onTap: () {},
            ),
            if (user != null)
              DrawerItem(
                title: 'Logout',
                icon: R.images.logoutIcon,
                onTap: () => _logout(ref, context),
              )
            else
              DrawerItem(
                title: 'Login',
                icon: R.images.logoutIcon,
                onTap: () {
                  GoRouter.of(context).push(RoutePaths.login);
                },
              )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 26.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            20.wb,
            Text(
              title,
              style: TextStyle(
                fontSize: 13.22.sp,
                color: R.colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
