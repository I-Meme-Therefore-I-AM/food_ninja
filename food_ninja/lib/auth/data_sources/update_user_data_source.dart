import 'package:food_ninja/auth/models/update_user_model.dart';
import 'package:food_ninja/core/error/failure.dart';
import 'package:food_ninja/core/error/server_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UpdateUserDataSource {
  Future<Either<Failure, String>> userPersonalInfo(
      {required UpdateUserModel personalInfo});
}

class UpdateUserDataSourceImpl implements UpdateUserDataSource {
  final SupabaseClient supabaseClient;

  UpdateUserDataSourceImpl({required this.supabaseClient});

  @override
  Future<Either<Failure, String>> userPersonalInfo(
      {required UpdateUserModel personalInfo}) async {
    try {
      final resp = await supabaseClient
          .from("users")
          .update({
            "first_name": personalInfo.firstName,
            "last_name": personalInfo.lastName,
            "phone_number": personalInfo.phoneNumber,
          })
          .eq("id", personalInfo.userId)
          .select();

      if (resp.isEmpty) {
        print(resp);
        throw ServerException(message: resp.toString());
      }
      return Right("User updated successful");
    } catch (error) {
      print(error.toString());
      return left(Failure(error.toString()));
    }
  }
}
