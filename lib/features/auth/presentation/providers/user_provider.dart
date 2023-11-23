import 'package:breather_app/features/auth/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  void setUser(UserModel user) {
    state = user;
  }

  UserModel? get user => state;

  void clear() {
    state = null;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>(
  (ref) => UserNotifier(),
);
