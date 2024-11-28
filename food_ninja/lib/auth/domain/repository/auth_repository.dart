import 'package:food_ninja/auth/entities/user_entity.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserSignUpEntityResp>> signUp(
      {required UserSignUpEntity user});
  Future<Either<Failure, UserSignUpEntityResp>> login(
      {required String email, required String password});
}
