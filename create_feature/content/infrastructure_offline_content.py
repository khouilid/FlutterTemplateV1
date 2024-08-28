from utils import create_file
import os

def generate_infrastructure_offline_files(parent_dir):
    dir_path = os.path.join(parent_dir, "infrastructure")
    file_name_prefix = parent_dir

    # Create subdirectories in infrastructure
    subdirs = ["dtos", "isar", "remote", "local", "repository"]
    for subdir in subdirs:
        subdir_path = os.path.join(dir_path, subdir)
        if not os.path.exists(subdir_path):
            os.makedirs(subdir_path, exist_ok=True)
        else:
            print(f"Subdirectory {subdir_path} already exists.")

   # Generate DTO files

    suffix = "_dto.dart"
    content = f''' 
    import 'package:freezed_annotation/freezed_annotation.dart';
    import "../../domain/{file_name_prefix}_domain.dart";
    import  "../isar/{file_name_prefix}_isar.dart";
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


   factory {file_name_prefix.capitalize().replace("_", "")}Dto.fromIsar({file_name_prefix.capitalize().replace("_", "")}Isar {file_name_prefix.replace("_", "")}Isar) {{
        return {file_name_prefix.capitalize().replace("_", "")}Dto(
          id: {file_name_prefix.replace("_", "")}Isar.id,
          title: {file_name_prefix.replace("_", "")}Isar.title,
        ); }}



        {file_name_prefix.capitalize().replace("_", "")}Isar toIsar()=> 
         {file_name_prefix.capitalize().replace("_", "")}Isar()
        ..id = id
        ..title = title;
 

    }} '''

        


    # 
    create_file(os.path.join(dir_path, "dtos"), file_name_prefix, suffix, content)


    # Generate Isar files
    suffix = "_isar.dart"
    content = f''' 
    import '../../../../core/infrastructure/database/fast_hash_function.dart';
    import 'package:isar/isar.dart';
    part "{file_name_prefix}_isar.g.dart";

    @collection 
    @Name("{file_name_prefix.capitalize().replace("_", "")}")
    class {file_name_prefix.capitalize().replace("_", "")}Isar{{
      late int id;
      Id get isarId => fastHash("$id");
      late String title;
    }}'''
    
    create_file(os.path.join(dir_path, "isar"), file_name_prefix, suffix, content)


    # Generate repository files
    suffix = "_repository.dart"
    content = f''' import "../../../core/infrastructure/helpers/repository_helper.dart";
import "../remote/{file_name_prefix}_remote_datasource.dart";
import "../local/{file_name_prefix}_local_datasource.dart";
import "../../../core/infrastructure/helpers/internet_connection.dart";
import "../../domain/{file_name_prefix}_domain.dart";
import "../dtos/{file_name_prefix}_dto.dart";

 import "../../../core/domain/fresh.dart";

part "{file_name_prefix}_repository_helper.dart";




class {file_name_prefix.capitalize().replace("_", "")}Repository extends {file_name_prefix.capitalize().replace("_", "")}RepositoryHelper with RepositoryHelper {{
final {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource _{file_name_prefix.replace("_", "")}RemoteDataSource;
final {file_name_prefix.capitalize().replace("_", "")}LocalDataSource _{file_name_prefix.replace("_", "")}LocalDataSource;
final InternetConnectionService _internetConnectionService;

{file_name_prefix.capitalize().replace("_", "")}Repository(
this._{file_name_prefix.replace("_", "")}RemoteDataSource,
this._{file_name_prefix.replace("_", "")}LocalDataSource,
this._internetConnectionService,
): super(
          _{file_name_prefix.replace("_", "")}RemoteDataSource,
          _{file_name_prefix.replace("_", "")}LocalDataSource,
          _internetConnectionService,
        );


// Create {file_name_prefix.capitalize().replace("_", "")}     
FutureEitherFailureOrFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async =>
      handleData(                                                                                                         
        _create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.fromDomain({file_name_prefix.replace("_", "")}Domain)),
        (_) async {{
          return Future.value(
            _.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity),
          );
        }},);

// Get List {file_name_prefix.capitalize().replace("_", "")}       
FutureEitherFailureOrFresh<List<{file_name_prefix.capitalize().replace("_", "")}Domain>> getAll{file_name_prefix.capitalize().replace("_", "")}s() async =>
      handleData(
        _getAll{file_name_prefix.capitalize().replace("_", "")}s(),
        (_) async {{
           return Future.value(
            _.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity),
          );
        }} );

// Get by id {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOrFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> get{file_name_prefix.capitalize().replace("_", "")}ById(int id) async =>
      handleData(
        _get{file_name_prefix.capitalize().replace("_", "")}ById(id),
        (_) async {{
           return Future.value(
            _.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity),
          );
        }});

// Update {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOrFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async =>
      handleData(
        _update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.fromDomain({file_name_prefix.replace("_", "")}Domain)),
        (_) async {{
           return Future.value(
            _.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity),
          );
        }} );

// Delete {file_name_prefix.capitalize().replace("_", "")}
FutureEitherFailureOrFresh<bool> delete{file_name_prefix.capitalize().replace("_", "")}(int id) async =>
      handleData(
        _delete{file_name_prefix.capitalize().replace("_", "")}(id),
        (_) async {{
           return Future.value(
            _.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity),
          );
        }});   

        
}}'''
    
    create_file(os.path.join(dir_path, "repository"), file_name_prefix, suffix, content)



    # Generate Helper files
    suffix = "_repository_helper.dart"
    content = f''' 
part of "{file_name_prefix}_repository.dart";


class {file_name_prefix.capitalize().replace("_", "")}RepositoryHelper with RepositoryHelper {{
final {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource _{file_name_prefix.replace("_", "")}RemoteDataSource;
final {file_name_prefix.capitalize().replace("_", "")}LocalDataSource _{file_name_prefix.replace("_", "")}LocalDataSource;
final InternetConnectionService _internetConnectionService;

{file_name_prefix.capitalize().replace("_", "")}RepositoryHelper(
this._{file_name_prefix.replace("_", "")}RemoteDataSource,
this._{file_name_prefix.replace("_", "")}LocalDataSource,
this._internetConnectionService,
);



  // Create {file_name_prefix.capitalize().replace("_", "")}

  FutureFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> _create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto  {file_name_prefix.replace("_", "")}Dto) =>
      _internetConnectionService.when<Fresh<{file_name_prefix.capitalize().replace("_", "")}Domain>>(
        onData: () async {{
        
          final result = await _{file_name_prefix.replace("_", "")}RemoteDataSource.create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.replace("_", "")}Dto);
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}([result.toIsar()]);
          return Fresh.yes(result.toDomain());
  
        }},
        onError: () async 
        {{
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}([{file_name_prefix.replace("_", "")}Dto.toIsar()]);
          return Fresh.no({file_name_prefix.replace("_", "")}Dto.toDomain());
        }},
      );

      
  // Get List {file_name_prefix.capitalize().replace("_", "")}
  FutureFresh<List<{file_name_prefix.capitalize().replace("_", "")}Domain>> _getAll{file_name_prefix.capitalize().replace("_", "")}s() =>
      _internetConnectionService.when<Fresh<List<{file_name_prefix.capitalize().replace("_", "")}Domain>>>(
        onData: () async {{
          final result = await _{file_name_prefix.replace("_", "")}RemoteDataSource.getAll{file_name_prefix.capitalize().replace("_", "")}s();
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}(result.map((e) => e.toIsar()).toList());
          return Fresh.yes(result.map((e) => e.toDomain()).toList());
        }},
        onError: () async {{
          final result = await _{file_name_prefix.replace("_", "")}LocalDataSource.get{file_name_prefix.capitalize().replace("_", "")}(); 
          return Fresh.no(result.map((e) => e.toDomain()).toList());
        }},
      );

      
  // Get by id {file_name_prefix.capitalize().replace("_", "")}
  FutureFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> _get{file_name_prefix.capitalize().replace("_", "")}ById(int id) =>
      _internetConnectionService.when<Fresh<{file_name_prefix.capitalize().replace("_", "")}Domain>>(
        onData: () async {{
          final result = await _{file_name_prefix.replace("_", "")}RemoteDataSource.get{file_name_prefix.capitalize().replace("_", "")}ById(id);
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}([result.toIsar()]);
          return Fresh.yes(result.toDomain());
        }},
        onError: () async {{
          final result = await _{file_name_prefix.replace("_", "")}LocalDataSource.get{file_name_prefix.capitalize().replace("_", "")}();
            return Fresh.no(
            result.firstWhere(
              (element) => element.id == id ,
              orElse: () => {file_name_prefix.capitalize().replace("_", "")}Dto.empty(),
            ).toDomain(),
          );
        }},
      );

      
  // Update {file_name_prefix.capitalize().replace("_", "")}
  FutureFresh<{file_name_prefix.capitalize().replace("_", "")}Domain> _update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto  {file_name_prefix.replace("_", "")}Dto) =>
      _internetConnectionService.when<Fresh<{file_name_prefix.capitalize().replace("_", "")}Domain>>(
        onData: () async {{
          final result = await _{file_name_prefix.replace("_", "")}RemoteDataSource.update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.replace("_", "")}Dto);
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}([result.toIsar()]);
          return Fresh.yes(result.toDomain());
        }},
        onError: () async {{
          await _{file_name_prefix.replace("_", "")}LocalDataSource.upsert{file_name_prefix.capitalize().replace("_", "")}([{file_name_prefix.replace("_", "")}Dto.toIsar()]);
          return Fresh.no({file_name_prefix.replace("_", "")}Dto.toDomain());
        }},
      );

      
  // Delete {file_name_prefix.capitalize().replace("_", "")}
  FutureFresh<bool> _delete{file_name_prefix.capitalize().replace("_", "")}(int id) =>
      _internetConnectionService.when<Fresh<bool>>(
        onData: () async {{
          final result = await _{file_name_prefix.replace("_", "")}RemoteDataSource.delete{file_name_prefix.capitalize().replace("_", "")}(id);
          await _{file_name_prefix.replace("_", "")}LocalDataSource.delete{file_name_prefix.capitalize().replace("_", "")}();
          return Fresh.yes(result);
        }},
        onError: () async {{
          await _{file_name_prefix.replace("_", "")}LocalDataSource.delete{file_name_prefix.capitalize().replace("_", "")}();
          return Fresh.no(false);
        }},
      );

  
}}'''
    
    create_file(os.path.join(dir_path, "repository"), file_name_prefix, suffix, content)



    # Generate remote data source files
    suffix = "_remote_datasource.dart"
    content = f''' 
import 'package:dio/dio.dart';
import '../dtos/{file_name_prefix}_dto.dart';
import '../../../core/infrastructure/helpers/remote_service_helper.dart';


class {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource extends RemoteServiceHelper {{
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
 

    # Generate local data source files
    suffix = "_local_datasource.dart"
    class_name = file_name_prefix.capitalize().replace("_", "")
    dto_name = class_name + "Dto"
    isar_name = class_name + "Isar"
    content = f"""
    import 'package:isar/isar.dart';
    import '../../../core/infrastructure/database/isar_database.dart';
    import 'package:logger/logger.dart';
    import '../isar/{file_name_prefix}_isar.dart';
    import '../dtos/{file_name_prefix}_dto.dart';

class {class_name}LocalDataSource {{
  final IsarDatabase _database;

  {class_name}LocalDataSource(this._database);

  // GET ALL DATA FROM ISAR [{class_name}]
  Future<List<{dto_name}>> get{class_name}() async {{
    final {file_name_prefix.lower()} = await _database.isar.{file_name_prefix.lower()}Isars.where().findAll();
    return {file_name_prefix.lower()}.map((e) => {dto_name}.fromIsar(e)).toList();
  }}

  // DELETE ALL DATA FROM ISAR [{class_name}]
  Future<int> delete{class_name}() async {{
    Logger().f("TODO: Check in delete the {class_name} not used on any other place");
    final {file_name_prefix.lower()} = await _database.isar.{file_name_prefix.lower()}Isars.where().findAll();
    final ids = {file_name_prefix.lower()}.map((e) => e.isarId).toList();
    return _database.isar.writeTxn(() => _database.isar.{file_name_prefix.lower()}Isars.deleteAll(ids));
  }}

  // ADD DATA TO ISAR [{class_name}]
  Future<void> upsert{class_name}(List<{isar_name}> {file_name_prefix.lower()}) async {{
    await _database.isar.writeTxn(() async {{
      await _database.isar.{file_name_prefix.lower()}Isars.putAll({file_name_prefix.lower()}.toSet().toList());
    }});
  }}
}}
"""
    

    create_file(os.path.join(dir_path, "local"), file_name_prefix, suffix, content)
