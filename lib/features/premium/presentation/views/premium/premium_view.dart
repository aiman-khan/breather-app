import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({super.key});

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
                  Color(0xFF3D66A0),
                  Color(0xFF111D4B),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: -16.w,
            child: SvgPicture.asset(
              R.images.premiumBg,
            ),
          ),
          Positioned(
            top: 41.h,
            child: Padding(
              padding: EdgeInsets.only(top: 12.h, left: 29.w, right: 29.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(RoutePaths.home);
                          },
                          child: SvgPicture.asset(
                            R.images.crossIcon,
                            height: 30.r,
                          ),
                        ),
                        143.wb,
                        Icon(
                          Icons.refresh,
                          color: R.colors.white,
                          size: 16.r,
                        ),
                        4.wb,
                        Text(
                          'Restore purchases',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: R.colors.white,
                            letterSpacing: 0.11.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    38.hb,
                    Column(
                      children: [
                        Text(
                          'Go Premium',
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: R.colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'No commitment, cancel anytime',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: R.colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        28.hb,
                        Container(
                          width: 308.w,
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 29.w,
                            bottom: 25.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF121F4D),
                                Color(0xFF385F97),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Weekly Pro',
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  color: R.colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              11.hb,
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: R.colors.white,
                                    size: 10.r,
                                  ),
                                  14.wb,
                                  SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      '7-days Pro Challenge',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: R.colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              19.hb,
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: R.colors.white,
                                    size: 10.r,
                                  ),
                                  14.wb,
                                  SizedBox(
                                    width: 238.w,
                                    child: Text(
                                      'Unlimited access to all features',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: R.colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              19.hb,
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: R.colors.white,
                                    size: 10.r,
                                  ),
                                  14.wb,
                                  SizedBox(
                                    width: 238.w,
                                    child: Text(
                                      'Advance focus time statistics',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: R.colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              19.hb,
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: R.colors.white,
                                    size: 10.r,
                                  ),
                                  14.wb,
                                  SizedBox(
                                    width: 238.w,
                                    child: Text(
                                      'Tagging successful session',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: R.colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              27.hb,
                              Divider(
                                color: R.colors.white,
                                thickness: 1.r,
                                endIndent: 24.w,
                              ),
                              28.hb,
                              Text(
                                '\$4.99/week',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: R.colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        40.hb,
                        FilledAppButton(
                          text: 'Start Trial',
                          onTap: () {},
                          height: 43.h,
                          width: 171.w,
                          colors: const [
                            Color(0xFF447BD2),
                            Color(0xFF3A589B),
                          ],
                        ),
                        19.hb,
                        SizedBox(
                          width: 300.w,
                          child: Text(
                            'You can cancel your subscription or trial anytime by cancelling your subscription through your iTunes account settings, or it will automatically renew. This must be done 24 hours before the end of the trial or any subscription period to avoid being charged.',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: R.colors.white,
                              letterSpacing: 0.11.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        20.hb,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294.w,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.7.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            R.colors.blue0460EA,
            R.colors.blue15316F,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 40.w,
            child: SvgPicture.asset(
              R.images.proIcon,
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.7.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              'Rs. $price',
              style: TextStyle(
                fontSize: 11.7.sp,
                fontWeight: FontWeight.w700,
                color: R.colors.greyBABABA,
              ),
            ),
          )
        ],
      ),
    );
  }
}
