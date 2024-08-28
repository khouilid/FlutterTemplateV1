 
import 'package:dio/dio.dart';
import '../dtos/template_test_dto.dart';
import '../../../core/infrastructure/helpers/remote_service_helper.dart';

class  TemplatetestRemoteDataSource extends RemoteServiceHelper {
  final Dio _dio;

TemplatetestRemoteDataSource(this._dio);


  // Create Templatetest
  Future<TemplatetestDto> createTemplatetest(TemplatetestDto  templatetestDto) async {
    return withoutRemoteResponse(
      _dio.post(
        "/template_test",
        data: templatetestDto.toJson(),
      ),
      (data) => TemplatetestDto.fromJson(data as Map<String, dynamic>),
    );}

    

  // Get List Templatetest
  Future<List<TemplatetestDto>> getAllTemplatetests() async {
    return withoutRemoteResponse(
      _dio.get(
        "/template_test",
      ),
      (data) => (data as List).map((e) => TemplatetestDto.fromJson(e as Map<String, dynamic>)).toList(),
    );}

    
   // Get by id Templatetest
  Future<TemplatetestDto> getTemplatetestById(int id) async {
    return withoutRemoteResponse(
      _dio.get(
        "/template_test/$id",
      ),
      (data) => TemplatetestDto.fromJson(data as Map<String, dynamic>),
    ); }

    
  // Update Templatetest
  Future<TemplatetestDto> updateTemplatetest(TemplatetestDto  templatetestDto) async {
    return withoutRemoteResponse(
      _dio.put(
        "/template_test/${templatetestDto.id}",
        data: templatetestDto.toJson(),
      ),
      (data) => TemplatetestDto.fromJson(data as Map<String, dynamic>),
    );}

  // Delete Templatetest
  Future<bool> deleteTemplatetest(int id) async {
    return withoutRemoteResponse(
      _dio.delete(
        "/template_test/$id",
      ),
      (data) => true,
    );}
}