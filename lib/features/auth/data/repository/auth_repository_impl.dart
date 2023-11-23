import 'package:breather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:breather_app/features/auth/domain/source/firebase/auth_firebase_data_source.dart';
import 'package:breather_app/features/auth/domain/source/local/auth_local_data_source.dart';
import 'package:breather_app/features/auth/domain/usecases/get_interests_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_from_firestore_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/is_fresh_install_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/remove_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/save_interest_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/set_fresh_install_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authFirebaseDataSource,
    required this.authLocalDataSource,
  });

  final AuthFirebaseDataSource authFirebaseDataSource;
  final AuthLocalDataSource authLocalDataSource;

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

  @override
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input) {
    return authLocalDataSource.getUser(input);
  }

  @override
  Future<SaveUserUsecaseOutput> saveUser(SaveUserUsecaseInput input) {
    return authLocalDataSource.saveUser(input);
  }

  @override
  Future<IsFreshInstallUsecaseOutput> isFreshInstall(
      IsFreshInstallUsecaseInput input) {
    return authLocalDataSource.isFreshInstall(input);
  }

  @override
  Future<SetFreshInstallUsecaseOutput> setFreshInstall(
      SetFreshInstallUsecaseInput input) {
    return authLocalDataSource.setFreshInstall(input);
  }

  @override
  Future<GetInterestsUsecaseOutput> getInterests(
      GetInterestsUsecaseInput input) {
    return authLocalDataSource.getInterests(input);
  }

  @override
  Future<SaveInterestUsecaseOutput> saveInterest(
      SaveInterestUsecaseInput input) {
    return authLocalDataSource.saveInterest(input);
  }

  @override
  Future<GetUserFromFirestoreUsecaseOutput> getUserFromFirestore(
      GetUserFromFirestoreUsecaseInput input) {
    return authFirebaseDataSource.getUserFromFirestore(input);
  }

  @override
  Future<RemoveUserUsecaseOutput> removeUser(RemoveUserUsecaseInput input) {
    return authLocalDataSource.removeUser(input);
  }
}
