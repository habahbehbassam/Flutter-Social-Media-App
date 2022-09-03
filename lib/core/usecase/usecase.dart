import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<type,Params> {
  Future<Either<Failure, type>> call(Params params);
}

class NoParams {}
