// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/src/either.dart';

import 'package:food_ninja/auth/domain/repository/auth_repository.dart';
import 'package:food_ninja/auth/entities/user_entity.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:food_ninja/core/usecases/usecases.dart';

class UserSignUp implements UseCases<UserSignUpEntityResp, UserSignUpEntity> {
  AuthRepository authRepository;
  UserSignUp({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, UserSignUpEntityResp>> call(param) async {
    final res = await authRepository.signUp(user: param);
    print(res);
    return res;
  }
}
