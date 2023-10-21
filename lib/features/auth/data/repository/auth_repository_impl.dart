import 'package:breather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:breather_app/features/auth/domain/source/firebase/auth_firebase_data_source.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authFirebaseDataSource});

  final AuthFirebaseDataSource authFirebaseDataSource;

  @override
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input) {
    return authFirebaseDataSource.login(input);
  }

  @override
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input) {
    return authFirebaseDataSource.register(input);
  }

  @override
  Future<SignInWithGoogleUsecaseOutput> signInWithGoogle(
      SignInWithGoogleUsecaseInput input) {
    return authFirebaseDataSource.signInWithGoogle(input);
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) {
    return authFirebaseDataSource.resetPassword(input);
  }
}
