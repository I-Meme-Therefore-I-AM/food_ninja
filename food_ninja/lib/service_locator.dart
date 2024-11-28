import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_ninja/auth/bloc/auth_bloc_bloc.dart';
import 'package:food_ninja/auth/data_sources/auth_remote_data_source.dart';
import 'package:food_ninja/auth/data_sources/auth_repository_impl.dart';
import 'package:food_ninja/auth/domain/repository/auth_repository.dart';
import 'package:food_ninja/auth/usescases/user_sign_up.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  _initAuth();
  await dotenv.load(fileName: '.env');

  final supaBase = await Supabase.initialize(
      url: dotenv.env['PROJECT_URL']!, anonKey: dotenv.env['API_KEY']!);

  sl.registerLazySingleton<SupabaseClient>(() => supaBase.client);
}

void _initAuth() {
  sl.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(supabaseClient: sl()));

  sl.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(authRemote: sl()));

  sl.registerFactory(() => UserSignUp(authRepository: sl()));
  sl.registerLazySingleton(() => AuthBlocBloc(userSignUp: sl()));
}
