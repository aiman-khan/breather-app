// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/repository/auth_repository_impl.dart' as _i6;
import '../../features/auth/data/source/firebase/auth_firebase_data_source_impl.dart'
    as _i4;
import '../../features/auth/domain/repository/auth_repository.dart' as _i5;
import '../../features/auth/domain/source/firebase/auth_firebase_data_source.dart'
    as _i3;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i7;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i10;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i11;
import '../../features/auth/domain/usecases/sign_in_with_google_usecase.dart'
    as _i12;
import '../helpers/persistence/persistence_helper.dart' as _i8;
import '../helpers/persistence/persistence_helper_imp.dart' as _i9;

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
    gh.lazySingleton<_i5.AuthRepository>(() => _i6.AuthRepositoryImpl(
        authFirebaseDataSource: gh<_i3.AuthFirebaseDataSource>()));
    gh.lazySingleton<_i7.LoginUsecase>(
        () => _i7.LoginUsecase(signUpRepository: gh<_i5.AuthRepository>()));
    gh.singleton<_i8.PersistenceHelper>(_i9.PersistenceHelperImpl());
    gh.lazySingleton<_i10.RegisterUsecase>(
        () => _i10.RegisterUsecase(signUpRepository: gh<_i5.AuthRepository>()));
    gh.lazySingleton<_i11.ResetPasswordUsecase>(() =>
        _i11.ResetPasswordUsecase(signUpRepository: gh<_i5.AuthRepository>()));
    gh.lazySingleton<_i12.SignInWithGoogleUsecase>(() =>
        _i12.SignInWithGoogleUsecase(
            signUpRepository: gh<_i5.AuthRepository>()));
    return this;
  }
}
