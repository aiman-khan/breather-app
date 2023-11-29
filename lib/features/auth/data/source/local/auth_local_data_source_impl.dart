import 'dart:convert';
import 'dart:developer';

import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:breather_app/features/auth/domain/source/local/auth_local_data_source.dart';
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
import 'package:breather_app/helpers/persistence/persistence_helper.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  AuthLocalDataSourceImp({
    required PersistenceHelper persistenceHelper,
  }) : _persistenceHelper = persistenceHelper;
  static const _user = 'user';
  static const _isFresh = 'isFresh';
  static const _interests = 'interests';

  final PersistenceHelper _persistenceHelper;

  @override
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input) async {
    final output = await _persistenceHelper.getString(_user);

    if (output == null) {
      return GetUserUsecaseOutput(user: null);
    }
    final user = UserModel.fromJson(json.decode(output));
    return GetUserUsecaseOutput(user: user);
  }

  @override
  Future<SaveUserUsecaseOutput> saveUser(SaveUserUsecaseInput input) async {
    final user = jsonEncode(input.user.toJson());
    await _persistenceHelper.saveString(_user, user);
    return SaveUserUsecaseOutput();
  }

  @override
  Future<IsFreshInstallUsecaseOutput> isFreshInstall(
      IsFreshInstallUsecaseInput input) async {
    final output = await _persistenceHelper.getBool(_isFresh);
    return IsFreshInstallUsecaseOutput(isFresh: output ?? false);
  }

  @override
  Future<SetFreshInstallUsecaseOutput> setFreshInstall(
      SetFreshInstallUsecaseInput input) async {
    await _persistenceHelper.saveBool(_isFresh, value: true);
    return SetFreshInstallUsecaseOutput();
  }

  @override
  Future<GetInterestsUsecaseOutput> getInterests(
      GetInterestsUsecaseInput input) async {
    final interests = await _persistenceHelper.getList(_interests);
    return GetInterestsUsecaseOutput(interests: interests);
  }

  @override
  Future<SaveInterestUsecaseOutput> saveInterest(
      SaveInterestUsecaseInput input) async {
    await _persistenceHelper.saveList(_interests, input.interests ?? []);
    return SaveInterestUsecaseOutput();
  }

  @override
  Future<RemoveUserUsecaseOutput> removeUser(
      RemoveUserUsecaseInput input) async {
    await _persistenceHelper.delete(_user);
    return RemoveUserUsecaseOutput();
  }

  @override
  Future<GetScheduleUsecaseOutput> getSchedule(
      GetScheduleUsecaseInput input) async {
    final output = await _persistenceHelper.getString(input.key);
    log('....got $output from ${input.key}');
    return GetScheduleUsecaseOutput(scheduledTime: output ?? '');
  }

  @override
  Future<RemoveScheduleUsecaseOutput> removeSchedule(
      RemoveScheduleUsecaseInput input) async {
    await _persistenceHelper.delete(input.key);

    return RemoveScheduleUsecaseOutput();
  }

  @override
  Future<SaveScheduleUsecaseOutput> saveSchedule(
      SaveScheduleUsecaseInput input) async {
    await _persistenceHelper.saveString(input.key, input.scheduledTime);
    log('....saved ${input.scheduledTime} to ${input.key}');

    return SaveScheduleUsecaseOutput();
  }
}
