import 'package:food_ninja/features/auth/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  UserModel? build() {
    return null;
  }

  void currentUser(UserModel user) {
    state = user;
  }
}
