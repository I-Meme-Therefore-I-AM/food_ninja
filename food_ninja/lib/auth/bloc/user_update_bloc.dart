import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/auth/models/update_user_model.dart';
import 'package:food_ninja/auth/usescases/user_update.dart';

part 'user_update_event.dart';
part 'user_update_state.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  final UserUpdate _updateUser;

  UserUpdateBloc({required UserUpdate userUpdate})
      : _updateUser = userUpdate,
        super(UserUpdateInitial()) {
    on<UpdateUserProfile>((event, emit) async {
      final res = await _updateUser(UpdateUserModel(
          firstName: event.firstName,
          lastName: event.lastName,
          phoneNumber: event.phoneNumber,
          userId: event.userId));

      res.fold((failure) => emit(UserUpdateFailure(failure.message)),
          (suc) => emit(UserUpdateSuccess(suc)));
    });
  }
}
