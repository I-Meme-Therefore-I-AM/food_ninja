import 'package:food_ninja/auth/data_sources/auth_remote_data_source.dart';
import 'package:food_ninja/auth/domain/repository/auth_repository.dart';
import 'package:food_ninja/auth/entities/user_entity.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:food_ninja/core/error/server_exception.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemote;

  AuthRepositoryImpl({required this.authRemote});
  @override
  Future<Either<Failure, UserSignUpEntityResp>> login(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserSignUpEntityResp>> signUp(
      {required UserSignUpEntity user}) async {
    try {
      final userId = await authRemote.signUp(user);
      return right(UserSignUpEntityResp(id: userId.id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
