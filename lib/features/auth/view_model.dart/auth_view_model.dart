import 'package:food_ninja/core/utils/current_user.dart';
import 'package:food_ninja/features/auth/model/user_model.dart';
import 'package:food_ninja/features/auth/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRepository _authRepository;
  @override
  AsyncValue<UserModel>? build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    state = const AsyncValue.loading();
    final resp = await _authRepository.signUp(
        userName: userName, email: email, password: password);
    final _ = switch (resp) {
      Left(value: final failure) => state =
          AsyncError(failure.message, StackTrace.current),
      Right(value: final user) => updateSignUpUserState(user),
    };
  }

  AsyncValue<UserModel>? updateSignUpUserState(UserModel user) {
    ref.read(currentUserProvider.notifier).setUser(user);
    state = AsyncData(user);
    return state;
  }
}
