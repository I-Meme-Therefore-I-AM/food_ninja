import 'package:food_ninja/auth/models/user_model.dart';

class UserSignUpEntityResp extends UserModel{
  UserSignUpEntityResp({required super.id});
}

class UserSignUpEntity extends UserSignUpParams{
  UserSignUpEntity({required super.email, required super.username, required super.password});
}
