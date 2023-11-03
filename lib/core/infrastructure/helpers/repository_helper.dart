import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import '../../domain/failure.dart';
import '../../domain/fresh.dart';
import '../exceptions/dio_exception.dart';

typedef FutureEitherFailureOr<T> = Future<Either<Failure, T>>;

typedef FutureEitherFailureOrFresh<T> = Future<Either<Failure, Fresh<T>>>;

mixin RepositoryHelper {

  FutureEitherFailureOr<R> handleData<R, T>(
      Future<T> future,
      Future<R> Function(T data) mapData,
      ) async {
    try {
      final value = await future;
      return right(await mapData(value));
    } on DioException catch (e)
    {
      return left(Failure.server(e.code, e.message.toString()));
    } on PlatformException catch (e) {
      return left(Failure.storage(e.message),);
    } catch (e) {
      if (e is IsarError)
      {
        return left(Failure.storage(e.message),);
      }
      return left(Failure.unknown(e.toString()));
    }
  }

}
