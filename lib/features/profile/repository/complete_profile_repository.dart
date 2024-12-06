import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/core/exception/failure.dart';
import 'package:food_ninja/core/exception/server_exception.dart';
import 'package:food_ninja/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'complete_profile_repository.g.dart';

@Riverpod(keepAlive: true)
CompleteProfileRepository completeProfileRepository(Ref ref) {
  return CompleteProfileRepository();
}

class CompleteProfileRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<Either<Failure, UserModel>> completeProfile(
      {required String uId,
      required String firstName,
      required String lastName,
      required String phoneNumber}) async {
    try {
      final resp = await _supabaseClient
          .from("users")
          .update({
            "first_name": firstName,
            "last_name": lastName,
            "phone_number": phoneNumber
          })
          .eq("id", uId)
          .select('id, phone_number')
          .single();

      if (resp.isEmpty) {
        throw ServerException();
      }
      print(resp);
      return right(UserModel.fromMap(
          {'uId': resp['id'], 'phoneNumber': resp['phone_number']}));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
