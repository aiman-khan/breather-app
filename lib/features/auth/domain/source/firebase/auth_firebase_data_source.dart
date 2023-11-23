import 'package:breather_app/features/auth/domain/usecases/get_user_from_firestore_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:breather_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';

abstract class AuthFirebaseDataSource {
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input);

  Future<LoginUsecaseOutput> login(LoginUsecaseInput input);

  Future<SignInWithGoogleUsecaseOutput> signInWithGoogle(
      SignInWithGoogleUsecaseInput input);

  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input);

  Future<GetUserFromFirestoreUsecaseOutput> getUserFromFirestore(
      GetUserFromFirestoreUsecaseInput input);
}
