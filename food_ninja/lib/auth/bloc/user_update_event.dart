part of 'user_update_bloc.dart';

@immutable
sealed class UserUpdateEvent {}

class UpdateUserProfile extends UserUpdateEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userId;

  UpdateUserProfile(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.userId});
}
