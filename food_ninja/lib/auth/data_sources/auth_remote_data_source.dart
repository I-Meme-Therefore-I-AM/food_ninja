import 'package:food_ninja/auth/entities/user_entity.dart';
import 'package:food_ninja/auth/models/user_model.dart';
import 'package:food_ninja/core/error/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUp(UserSignUpEntity user);
  Future<UserSignUpEntity> logIn(
      {required email, required password, required username});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<UserSignUpEntity> logIn(
      {required email, required password, required username}) {
    throw UnimplementedError();
  }

  // handle user signup process
  @override
  Future<UserModel> signUp(UserSignUpParams user) async {
    try {
      final resp = await supabaseClient.auth.signUp(
          email: user.email,
          password: user.password,
          data: {'username': user.username});

      print(resp);
      if (resp.user != null) {
        print('success--------------->');
        return UserModel(id: resp.user!.id);
      }

      throw ServerException(message: "User is null");
    } on AuthApiException catch (error) {
        print('success--------------->');
      throw ServerException(message: error.toString());
    }
  }
}
