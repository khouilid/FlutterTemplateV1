import '../../core/infrastructure/helpers/remote_service_helper.dart';
import 'package:dio/dio.dart';

class TemplatetestRemoteDataSource extends RemoteServiceHelper {
  final Dio _dio;

  TemplatetestRemoteDataSource(this._dio);

//   Future<Foo> makeFoo()
//     return withoutRemoteResponse(_dio.post("/"), (_) =>   Foo );
//  }
}
