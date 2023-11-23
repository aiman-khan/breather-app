import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:breather_app/features/breathing_test/domain/usecases/award_badge_usecase.dart';
import 'package:breather_app/utils/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final awardBadgeProvider =
    FutureProvider.autoDispose.family<void, List<String>>((ref, badges) async {
  final awardBadgeUsecase = sl<AwardBadgeUsecase>();
  final user = ref.watch(userProvider);

  final input = AwardBadgeUsecaseInput(
    userId: user?.id ?? '',
    badges: badges,
  );

  await awardBadgeUsecase(input);
});
