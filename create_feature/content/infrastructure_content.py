from utils import create_file
import os

def generate_infrastructure_files(parent_dir):
    dir_path = os.path.join(parent_dir, "infrastructure")
    file_name_prefix = parent_dir

    # Create subdirectories in infrastructure
    subdirs = ["dtos", "isar", "remote", "repository"]
    for subdir in subdirs:
        subdir_path = os.path.join(dir_path, subdir)
        if not os.path.exists(subdir_path):
            os.makedirs(subdir_path, exist_ok=True)
        else:
            print(f"Subdirectory {subdir_path} already exists.")


    # Generate repository files
    suffix = "_repository.dart"
    content = f''' import "../../../core/infrastructure/helpers/repository_helper.dart";
import "../remote/{file_name_prefix}_remote_datasource.dart";
import "../../domain/{file_name_prefix}_domain.dart";
import "../dtos/{file_name_prefix}_dto.dart";
class {file_name_prefix.capitalize().replace("_", "")}Repository with RepositoryHelper {{
final {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource _{file_name_prefix.replace("_", "")}RemoteDataSource;
{file_name_prefix.capitalize().replace("_", "")}Repository(this._{file_name_prefix.replace("_", "")}RemoteDataSource);



// Create {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOr<{file_name_prefix.capitalize().replace("_", "")}Domain> create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async =>
      handleData(                                                                                                         
        _{file_name_prefix.replace("_", "")}RemoteDataSource.create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.fromDomain({file_name_prefix.replace("_", "")}Domain)),
        (_) async {{
          return _.toDomain();
        }},);


        
// Get List {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOr<List<{file_name_prefix.capitalize().replace("_", "")}Domain>> getAll{file_name_prefix.capitalize().replace("_", "")}s() async =>
      handleData(
        _{file_name_prefix.replace("_", "")}RemoteDataSource.getAll{file_name_prefix.capitalize().replace("_", "")}s(),
        (_) async {{
          return _.map((e) => e.toDomain()).toList();
        }} );

// Get By id {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOr<{file_name_prefix.capitalize().replace("_", "")}Domain> get{file_name_prefix.capitalize().replace("_", "")}ById(int id) async =>
      handleData(
        _{file_name_prefix.replace("_", "")}RemoteDataSource.get{file_name_prefix.capitalize().replace("_", "")}ById(id),
        (_) async {{
          return _.toDomain();
        }});

// Update {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOr<{file_name_prefix.capitalize().replace("_", "")}Domain> update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async =>
      handleData(
        _{file_name_prefix.replace("_", "")}RemoteDataSource.update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.fromDomain({file_name_prefix.replace("_", "")}Domain)),
        (_) async {{
          return _.toDomain();
        }} );

// Delete {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOr<bool> delete{file_name_prefix.capitalize().replace("_", "")}(int id) async =>
      handleData(
        _{file_name_prefix.replace("_", "")}RemoteDataSource.delete{file_name_prefix.capitalize().replace("_", "")}(id),
        (_) async {{
          return _;
        }});   
}}'''
    create_file(os.path.join(dir_path, "repository"), file_name_prefix, suffix, content)

    # Generate DTO files
    suffix = "_dto.dart"
    content = f''' 
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../domain/{file_name_prefix}_domain.dart";
part "{file_name_prefix}_dto.freezed.dart";
part "{file_name_prefix}_dto.g.dart";

@freezed
class {file_name_prefix.capitalize().replace("_", "")}Dto with _${
        file_name_prefix.capitalize().replace("_", "")
    }Dto {{
const {file_name_prefix.capitalize().replace("_", "")}Dto._();
const factory {file_name_prefix.capitalize().replace("_", "")}Dto({{
@Default(0) @JsonKey(name: 'id')  int id,
@Default("") @JsonKey(name: 'title')  String title,
}})= _{file_name_prefix.capitalize().replace("_", "")}Dto;

factory {file_name_prefix.capitalize().replace("_", "")}Dto.fromJson(Map<String, dynamic> json) =>  _${
        file_name_prefix.capitalize().replace("_", "")
    }DtoFromJson(json);
factory {file_name_prefix.capitalize().replace("_", "")}Dto.empty()=> {file_name_prefix.capitalize().replace("_", "")}Dto(
id: 0,
title: "",
);

  factory {file_name_prefix.capitalize().replace("_", "")}Dto.fromDomain({file_name_prefix.capitalize().replace("_", "")}Domain {file_name_prefix.replace("_", "")}Domain) {{
    return {file_name_prefix.capitalize().replace("_", "")}Dto(
      id: {file_name_prefix.replace("_", "")}Domain.id,
      title: {file_name_prefix.replace("_", "")}Domain.title,
    ); }}

  {file_name_prefix.capitalize().replace("_", "")}Domain toDomain() {{
    return {file_name_prefix.capitalize().replace("_", "")}Domain(
      id: id,
      title: title,
    );}}

}}'''
    create_file(os.path.join(dir_path, "dtos"), file_name_prefix, suffix, content)

    # Generate remote data source files
    suffix = "_remote_datasource.dart"
    content = f''' 
import 'package:dio/dio.dart';
import '../dtos/{file_name_prefix}_dto.dart';
import '../../../core/infrastructure/helpers/remote_service_helper.dart';

class  {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource extends RemoteServiceHelper {{
  final Dio _dio;

{file_name_prefix.capitalize().replace("_", "")}RemoteDataSource(this._dio);


  // Create {file_name_prefix.capitalize().replace("_", "")}
  Future<{file_name_prefix.capitalize().replace("_", "")}Dto> create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto  {file_name_prefix.replace("_", "")}Dto) async {{
    return withoutRemoteResponse(
      _dio.post(
        "/{file_name_prefix}",
        data: {file_name_prefix.replace("_", "")}Dto.toJson(),
      ),
      (data) => {file_name_prefix.capitalize().replace("_", "")}Dto.fromJson(data as Map<String, dynamic>),
    );}}

    

  // Get List {file_name_prefix.capitalize().replace("_", "")}
  Future<List<{file_name_prefix.capitalize().replace("_", "")}Dto>> getAll{file_name_prefix.capitalize().replace("_", "")}s() async {{
    return withoutRemoteResponse(
      _dio.get(
        "/{file_name_prefix}",
      ),
      (data) => (data as List).map((e) => {file_name_prefix.capitalize().replace("_", "")}Dto.fromJson(e as Map<String, dynamic>)).toList(),
    );}}

    
   // Get by id {file_name_prefix.capitalize().replace("_", "")}
  Future<{file_name_prefix.capitalize().replace("_", "")}Dto> get{file_name_prefix.capitalize().replace("_", "")}ById(int id) async {{
    return withoutRemoteResponse(
      _dio.get(
        "/{file_name_prefix}/$id",
      ),
      (data) => {file_name_prefix.capitalize().replace("_", "")}Dto.fromJson(data as Map<String, dynamic>),
    ); }}

    
  // Update {file_name_prefix.capitalize().replace("_", "")}
  Future<{file_name_prefix.capitalize().replace("_", "")}Dto> update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto  {file_name_prefix.replace("_", "")}Dto) async {{
    return withoutRemoteResponse(
      _dio.put(
        "/{file_name_prefix}/${{{file_name_prefix.replace("_", "")}Dto.id}}",
        data: {file_name_prefix.replace("_", "")}Dto.toJson(),
      ),
      (data) => {file_name_prefix.capitalize().replace("_", "")}Dto.fromJson(data as Map<String, dynamic>),
    );}}

  // Delete {file_name_prefix.capitalize().replace("_", "")}
  Future<bool> delete{file_name_prefix.capitalize().replace("_", "")}(int id) async {{
    return withoutRemoteResponse(
      _dio.delete(
        "/{file_name_prefix}/$id",
      ),
      (data) => true,
    );}}
}}'''
    create_file(os.path.join(dir_path, "remote"), file_name_prefix, suffix, content)
