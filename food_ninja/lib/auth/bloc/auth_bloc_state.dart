part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {
  const AuthBlocState();
}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthLoading extends AuthBlocState {}

final class AuthSucess extends AuthBlocState {
  final String uId;

  const AuthSucess(this.uId);
}

final class AuthFailure extends AuthBlocState {
  final String message;
  const AuthFailure(this.message);
}
