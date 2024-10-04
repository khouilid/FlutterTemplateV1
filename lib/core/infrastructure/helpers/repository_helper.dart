import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:template/core/domain/failure.dart';
import 'package:template/core/domain/fresh.dart';
import 'package:template/core/infrastructure/exceptions/dio_exception.dart';

typedef FutureEitherFailureOr<T> = Future<Either<Failure, T>>;

typedef FutureEitherFailureOrFresh<T> = Future<Either<Failure, Fresh<T>>>;

typedef FutureFresh<T> = Future<Fresh<T>>;

typedef StreamEitherFailureOr<T> = Stream<Either<Failure, T>>;

mixin RepositoryHelper {
  FutureEitherFailureOr<R> handleData<R, T>(
    Future<T> future,
    Future<R> Function(T data) mapData,
  ) async {
    try {
      final value = await future;
      return right(await mapData(value));
    } on DioException catch (e) {
      return left(Failure.server(e.code, e.message.toString()));
    } on PlatformException catch (e) {
      return left(
        Failure.storage(e.message),
      );
    } catch (e) {
      // ! This is a temporary solution to handle errors.
      // if (e is IsarError) {
      //   return left(
      //     Failure.storage(e.message),
      //   );
      // }
      return left(Failure.unknown(e.toString()));
    }
  }
}
