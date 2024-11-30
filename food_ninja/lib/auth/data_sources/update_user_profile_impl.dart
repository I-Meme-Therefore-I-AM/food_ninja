import 'package:food_ninja/auth/data_sources/update_user_data_source.dart';
import 'package:food_ninja/auth/domain/repository/update_user_profile.dart';
import 'package:food_ninja/auth/models/update_user_model.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

class UpdateUserProfileImpl implements UpdateUserProfileRepository {
  final UpdateUserDataSource userData;

  UpdateUserProfileImpl({required this.userData});

  @override
  Future<Either<Failure, String>> updateUserProfile(
      {required UpdateUserModel userInfo}) async {
    final resp = await userData.userPersonalInfo(personalInfo: userInfo);
    print(resp.toString());
    return resp;
  }
}
