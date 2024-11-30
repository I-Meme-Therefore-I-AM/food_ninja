part of 'user_update_bloc.dart';

@immutable
sealed class UserUpdateState {}

final class UserUpdateInitial extends UserUpdateState {}

final class UserUpdateSuccess extends UserUpdateState {
  final String message;

  UserUpdateSuccess(this.message);
}

final class UserUpdateFailure extends UserUpdateState {
  final String message;

  UserUpdateFailure(this.message);
}

final class UserUpdateLoading extends UserUpdateState {}
