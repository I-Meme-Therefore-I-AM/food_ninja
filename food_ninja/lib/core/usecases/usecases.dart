import 'package:food_ninja/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}
