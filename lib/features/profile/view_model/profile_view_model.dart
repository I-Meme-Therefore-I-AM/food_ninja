import 'package:food_ninja/features/auth/model/user_model.dart';
import 'package:food_ninja/features/auth/view_model.dart/auth_view_model.dart';
import 'package:food_ninja/features/profile/repository/complete_profile_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  late CompleteProfileRepository _completeProfileRepository;
  @override
  AsyncValue<UserModel>? build() {
    _completeProfileRepository = ref.watch(completeProfileRepositoryProvider);
    return null;
  }

  Future<void> userBio(
      {required String firstName,
      required String uId,
      required String lastName,
      required String phoneNumber}) async {
    final resp = await _completeProfileRepository.completeProfile(
        uId: uId,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber);

    final _ = switch (resp) {
      Left(value: final failure) => state =
          AsyncValue.error(failure.message, StackTrace.current),
      Right(value: final user) => updateUserInstance(user),
    };

    print(_);
  }

  AsyncValue<UserModel>? updateUserInstance(UserModel user) {
    return ref.read(authViewModelProvider.notifier).updateSignUpUserState(user);
  }
}
