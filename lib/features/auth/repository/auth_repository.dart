import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/core/exception/failure.dart';
import 'package:food_ninja/core/exception/server_exception.dart';
import 'package:food_ninja/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

class AuthRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<Either<Failure, UserModel>> signUp(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final resp = await _supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'username': userName},
      );

      if (resp.user == null) {
        throw ServerException();
      }

      return right(UserModel.fromMap({"uId": resp.user!.id}));
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on ServerException catch (_) {
      return left(Failure(message: "Server exception error"));
    }
  }
}
