
class UserModel {
  final String id;
  UserModel({required this.id});
}

class UserSignUpParams {
  final String email;
  final String username;
  final String password;

  UserSignUpParams(
      {required this.email, required this.username, required this.password});
}
