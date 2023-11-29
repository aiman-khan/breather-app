// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/repository/auth_repository_impl.dart' as _i19;
import '../../features/auth/data/source/firebase/auth_firebase_data_source_impl.dart'
    as _i4;
import '../../features/auth/data/source/local/auth_local_data_source_impl.dart'
    as _i17;
import '../../features/auth/domain/repository/auth_repository.dart' as _i18;
import '../../features/auth/domain/source/firebase/auth_firebase_data_source.dart'
    as _i3;
import '../../features/auth/domain/source/local/auth_local_data_source.dart'
    as _i16;
import '../../features/auth/domain/usecases/get_interests_usecase.dart' as _i21;
import '../../features/auth/domain/usecases/get_user_from_firestore_usecase.dart'
    as _i23;
import '../../features/auth/domain/usecases/get_user_usecase.dart' as _i24;
import '../../features/auth/domain/usecases/is_fresh_install_usecase.dart'
    as _i25;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i26;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i27;
import '../../features/auth/domain/usecases/remove_user_usecase.dart' as _i29;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i30;
import '../../features/auth/domain/usecases/save_interest_usecase.dart' as _i31;
import '../../features/auth/domain/usecases/save_user_usecase.dart' as _i33;
import '../../features/auth/domain/usecases/set_fresh_install_usecase.dart'
    as _i34;
import '../../features/auth/domain/usecases/sign_in_with_google_usecase.dart'
    as _i35;
import '../../features/breathing_test/data/repository/repository_impl.dart'
    as _i8;
import '../../features/breathing_test/data/source/firebase/firebase_data_source_impl.dart'
    as _i6;
import '../../features/breathing_test/domain/data/source/firebase/firebase_data_source.dart'
    as _i5;
import '../../features/breathing_test/domain/repository/repository.dart' as _i7;
import '../../features/breathing_test/domain/usecases/award_badge_usecase.dart'
    as _i20;
import '../../features/breathing_test/domain/usecases/get_score_usecase.dart'
    as _i9;
import '../../features/breathing_test/domain/usecases/get_streak_usecase.dart'
    as _i10;
import '../../features/breathing_test/domain/usecases/reset_score_usecase.dart'
    as _i13;
import '../../features/breathing_test/domain/usecases/save_score_usecase.dart'
    as _i14;
import '../../features/breathing_test/domain/usecases/save_streak_usecase.dart'
    as _i15;
import '../../features/schedular/domain/usecases/get_schedule_usecase.dart'
    as _i22;
import '../../features/schedular/domain/usecases/remove_schedule_usecase.dart'
    as _i28;
import '../../features/schedular/domain/usecases/save_schedule_usecase.dart'
    as _i32;
import '../../helpers/persistence/persistence_helper.dart' as _i11;
import '../../helpers/persistence/persistence_helper_imp.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthFirebaseDataSource>(
        () => _i4.AuthFirebaseDataSourceImpl());
    gh.lazySingleton<_i5.BreatherFirebaseDataSource>(
        () => _i6.BreatherFirebaseDataSourceImpl());
    gh.lazySingleton<_i7.BreatherRepository>(() => _i8.BreatherRepositoryImpl(
        breatherFirebaseDataSource: gh<_i5.BreatherFirebaseDataSource>()));
    gh.lazySingleton<_i9.GetScoreUsecase>(() =>
        _i9.GetScoreUsecase(breatherRepository: gh<_i7.BreatherRepository>()));
    gh.lazySingleton<_i10.GetStreakUsecase>(() => _i10.GetStreakUsecase(
        breatherRepository: gh<_i7.BreatherRepository>()));
    gh.singleton<_i11.PersistenceHelper>(_i12.PersistenceHelperImpl());
    gh.lazySingleton<_i13.ResetScoreUsecase>(() => _i13.ResetScoreUsecase(
        breatherRepository: gh<_i7.BreatherRepository>()));
    gh.lazySingleton<_i14.SaveScoreUsecase>(() => _i14.SaveScoreUsecase(
        breatherRepository: gh<_i7.BreatherRepository>()));
    gh.lazySingleton<_i15.SaveStreakUsecase>(() => _i15.SaveStreakUsecase(
        breatherRepository: gh<_i7.BreatherRepository>()));
    gh.lazySingleton<_i16.AuthLocalDataSource>(() =>
        _i17.AuthLocalDataSourceImp(
            persistenceHelper: gh<_i11.PersistenceHelper>()));
    gh.lazySingleton<_i18.AuthRepository>(() => _i19.AuthRepositoryImpl(
          authFirebaseDataSource: gh<_i3.AuthFirebaseDataSource>(),
          authLocalDataSource: gh<_i16.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i20.AwardBadgeUsecase>(() => _i20.AwardBadgeUsecase(
        breatherRepository: gh<_i7.BreatherRepository>()));
    gh.lazySingleton<_i21.GetInterestsUsecase>(() =>
        _i21.GetInterestsUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i22.GetScheduleUsecase>(() => _i22.GetScheduleUsecase(
        schedularRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i23.GetUserFromFirestoreUsecase>(() =>
        _i23.GetUserFromFirestoreUsecase(
            signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i24.GetUserUsecase>(
        () => _i24.GetUserUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i25.IsFreshInstallUsecase>(() =>
        _i25.IsFreshInstallUsecase(
            signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i26.LoginUsecase>(
        () => _i26.LoginUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i27.RegisterUsecase>(() =>
        _i27.RegisterUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i28.RemoveScheduleUsecase>(() =>
        _i28.RemoveScheduleUsecase(
            schedularRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i29.RemoveUserUsecase>(() =>
        _i29.RemoveUserUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i30.ResetPasswordUsecase>(() =>
        _i30.ResetPasswordUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i31.SaveInterestUsecase>(() =>
        _i31.SaveInterestUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i32.SaveScheduleUsecase>(() => _i32.SaveScheduleUsecase(
        schedularRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i33.SaveUserUsecase>(() =>
        _i33.SaveUserUsecase(signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i34.SetFreshInstallUsecase>(() =>
        _i34.SetFreshInstallUsecase(
            signUpRepository: gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i35.SignInWithGoogleUsecase>(() =>
        _i35.SignInWithGoogleUsecase(
            signUpRepository: gh<_i18.AuthRepository>()));
    return this;
  }
}
