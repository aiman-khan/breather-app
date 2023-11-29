import 'package:breather_app/features/auth/domain/usecases/get_interests_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/is_fresh_install_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/remove_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/save_interest_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/set_fresh_install_usecase.dart';
import 'package:breather_app/features/schedular/domain/usecases/get_schedule_usecase.dart';
import 'package:breather_app/features/schedular/domain/usecases/remove_schedule_usecase.dart';
import 'package:breather_app/features/schedular/domain/usecases/save_schedule_usecase.dart';

abstract class AuthLocalDataSource {
  Future<SaveUserUsecaseOutput> saveUser(SaveUserUsecaseInput input);

  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input);

  Future<SetFreshInstallUsecaseOutput> setFreshInstall(
      SetFreshInstallUsecaseInput input);

  Future<IsFreshInstallUsecaseOutput> isFreshInstall(
      IsFreshInstallUsecaseInput input);

  Future<SaveInterestUsecaseOutput> saveInterest(
      SaveInterestUsecaseInput input);

  Future<GetInterestsUsecaseOutput> getInterests(
      GetInterestsUsecaseInput input);

  Future<RemoveUserUsecaseOutput> removeUser(RemoveUserUsecaseInput input);

  Future<GetScheduleUsecaseOutput> getSchedule(GetScheduleUsecaseInput input);

  Future<SaveScheduleUsecaseOutput> saveSchedule(
      SaveScheduleUsecaseInput input);

  Future<RemoveScheduleUsecaseOutput> removeSchedule(
      RemoveScheduleUsecaseInput input);
}
