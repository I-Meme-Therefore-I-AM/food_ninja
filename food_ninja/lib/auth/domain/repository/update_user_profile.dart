import 'package:food_ninja/auth/models/update_user_model.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UpdateUserProfileRepository {
  Future<Either<Failure, String>> updateUserProfile({required UpdateUserModel userInfo});
}
