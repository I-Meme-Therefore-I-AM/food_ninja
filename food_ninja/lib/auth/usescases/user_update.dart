import 'package:food_ninja/auth/domain/repository/update_user_profile.dart';
import 'package:food_ninja/auth/models/update_user_model.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:food_ninja/core/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

class UserUpdate implements UseCases<String, UpdateUserModel> {
  final UpdateUserProfileRepository userProfile;

  UserUpdate({required this.userProfile});
  @override
  Future<Either<Failure, String>> call(UpdateUserModel param) async{
    return await userProfile.updateUserProfile(userInfo: param);
  }
}
