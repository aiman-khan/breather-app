import 'dart:developer';

import 'package:breather_app/common/extensions/num.dart';
import 'package:breather_app/common/widgets/app_name_widget.dart';
import 'package:breather_app/common/widgets/filled_app_button.dart';
import 'package:breather_app/features/auth/domain/usecases/save_interest_usecase.dart';
import 'package:breather_app/features/auth/presentation/providers/interests_provider.dart';
import 'package:breather_app/features/auth/presentation/views/interest_selection/widgets/interest_card_widget.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:breather_app/utils/loading/loading.dart';
import 'package:breather_app/utils/resource/r.dart';
import 'package:breather_app/utils/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InterestSelectionView extends ConsumerStatefulWidget {
  const InterestSelectionView({super.key});

  @override
  ConsumerState<InterestSelectionView> createState() =>
      _InterestSelectionViewState();
}

class _InterestSelectionViewState extends ConsumerState<InterestSelectionView> {
  Future<void> saveInterests() async {
    final saveInterestsUsecase = sl<SaveInterestUsecase>();
    final interests = ref.watch(interestsProvider);
    try {
      loading(context);
      await saveInterestsUsecase(
        SaveInterestUsecaseInput(
          interests: interests,
        ),
      );

      if (mounted) {
        GoRouter.of(context).pushReplacement(RoutePaths.permission);
      }
    } catch (e) {
      log('An error occurred while saving');
    } finally {
      dismissLoading();
    }
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
            top: 40.h,
            child: Padding(
              padding: EdgeInsets.only(
                top: 33.h,
                left: 30.w,
                right: 30.w,
              ),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      /// [App Name]
                      const AppNameWidget(),

                      16.hb,

                      Text(
                        'Select your',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: R.colors.blue132D69,
                        ),
                      ),
                      Text(
                        'Interest',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          color: R.colors.blue132D69,
                          letterSpacing: 0.52,
                        ),
                      ),

                      14.hb,

                      SizedBox(
                        width: 296.w,
                        child: Text(
                          'which breath categories do you want to measure on a regular basis? You can always change them later.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: R.colors.blue132D69,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      18.hb,

                      const InterestCardWidget(),

                      60.hb,

                      FilledAppButton(
                        text: 'Next',
                        onTap: saveInterests,
                        width: 98.w,
                        height: 40.h,
                        fontSize: 13.22.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
