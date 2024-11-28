part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class AuthSignUp extends AuthBlocEvent {
  final String email;
  final String password;
  final String username;

  AuthSignUp(
      {required this.email, required this.password, required this.username});
}
