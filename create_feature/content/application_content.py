from utils import create_file
import os

def generate_application_files(parent_dir):
    dir_path = os.path.join(parent_dir, "application")
    file_name_prefix = parent_dir

    # Generate state files
    suffix = "_states.dart"
    content = f''' 
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/failure.dart';
import '../domain/{file_name_prefix}_domain.dart';
part "{file_name_prefix}_states.freezed.dart";

@freezed
class {file_name_prefix.capitalize().replace("_", "")}State with _${
        file_name_prefix.capitalize().replace("_", "")
    }State {{
  const {file_name_prefix.capitalize().replace("_", "")}State._(); 
  const factory {file_name_prefix.capitalize().replace("_", "")}State.loading() = _Loading;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.initial() = _Initial;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failure() = _Failure;

  const factory {file_name_prefix.capitalize().replace("_", "")}State.loadingCreate{file_name_prefix.capitalize().replace("_", "")}() = _LoadingCreate{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.successCreate{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain {file_name_prefix.replace("_", "")}Domain) = _SuccessCreate{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failureCreate{file_name_prefix.capitalize().replace("_", "")}(Failure  failure) = _FailureCreate{file_name_prefix.capitalize().replace("_", "")};

  const factory {file_name_prefix.capitalize().replace("_", "")}State.loadingGetAll{file_name_prefix.capitalize().replace("_", "")}s() = _LoadingGetAll{file_name_prefix.capitalize().replace("_", "")}s;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.successGetAll{file_name_prefix.capitalize().replace("_", "")}s(List<{file_name_prefix.capitalize().replace("_", "")}Domain> {file_name_prefix.replace("_", "")}sDomain) = _SuccessGetAll{file_name_prefix.capitalize().replace("_", "")}s;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failureGetAll{file_name_prefix.capitalize().replace("_", "")}s(Failure  failure) = _FailureGetAll{file_name_prefix.capitalize().replace("_", "")}s;

  const factory {file_name_prefix.capitalize().replace("_", "")}State.loadingGet{file_name_prefix.capitalize().replace("_", "")}ById() = _LoadingGet{file_name_prefix.capitalize().replace("_", "")}ById;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.successGet{file_name_prefix.capitalize().replace("_", "")}ById({file_name_prefix.capitalize().replace("_", "")}Domain {file_name_prefix.replace("_", "")}Domain) = _SuccessGet{file_name_prefix.capitalize().replace("_", "")}ById;
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failureGet{file_name_prefix.capitalize().replace("_", "")}ById(Failure  failure) = _FailureGet{file_name_prefix.capitalize().replace("_", "")}ById;

  const factory {file_name_prefix.capitalize().replace("_", "")}State.loadingUpdate{file_name_prefix.capitalize().replace("_", "")}() = _LoadingUpdate{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.successUpdate{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain {file_name_prefix.replace("_", "")}Domain) = _SuccessUpdate{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failureUpdate{file_name_prefix.capitalize().replace("_", "")}(Failure  failure) = _FailureUpdate{file_name_prefix.capitalize().replace("_", "")};

  const factory {file_name_prefix.capitalize().replace("_", "")}State.loadingDelete{file_name_prefix.capitalize().replace("_", "")}() = _LoadingDelete{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.successDelete{file_name_prefix.capitalize().replace("_", "")}() = _SuccessDelete{file_name_prefix.capitalize().replace("_", "")};
  const factory {file_name_prefix.capitalize().replace("_", "")}State.failureDelete{file_name_prefix.capitalize().replace("_", "")}(Failure  failure) = _FailureDelete{file_name_prefix.capitalize().replace("_", "")};

}}'''
    create_file(dir_path, file_name_prefix, suffix, content)

    # Generate notifier files
    suffix = "_notifier.dart"
    content = f''' 
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "{file_name_prefix}_states.dart";
import '../infrastructure/repository/{file_name_prefix}_repository.dart';
import '../domain/{file_name_prefix}_domain.dart';

class {file_name_prefix.capitalize().replace("_", "")}StateNotifier extends StateNotifier<{file_name_prefix.capitalize().replace("_", "")}State> {{
final {file_name_prefix.capitalize().replace("_", "")}Repository  _{file_name_prefix.replace("_", "")}Repository;

{file_name_prefix.capitalize().replace("_", "")}StateNotifier(this._{file_name_prefix.replace("_", "")}Repository) : super(const {file_name_prefix.capitalize().replace("_", "")}State.initial());

// Create {file_name_prefix.capitalize().replace("_", "")}
Future<void> create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async {{
    state = const {file_name_prefix.capitalize().replace("_", "")}State.loadingCreate{file_name_prefix.capitalize().replace("_", "")}();
    final result = await _{file_name_prefix.replace("_", "")}Repository.create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.replace("_", "")}Domain);
    result.fold(
      (failure) => state = {file_name_prefix.capitalize().replace("_", "")}State.failureCreate{file_name_prefix.capitalize().replace("_", "")}(failure),
      (success) => state = {file_name_prefix.capitalize().replace("_", "")}State.successCreate{file_name_prefix.capitalize().replace("_", "")}(success),
    );
}}

// Get all {file_name_prefix.capitalize().replace("_", "")}s
Future<void> getAll{file_name_prefix.capitalize().replace("_", "")}s() async {{
    state = const {file_name_prefix.capitalize().replace("_", "")}State.loadingGetAll{file_name_prefix.capitalize().replace("_", "")}s();
    final result = await _{file_name_prefix.replace("_", "")}Repository.getAll{file_name_prefix.capitalize().replace("_", "")}s();
    result.fold(
      (failure) => state = {file_name_prefix.capitalize().replace("_", "")}State.failureGetAll{file_name_prefix.capitalize().replace("_", "")}s(failure),
      (success) => state = {file_name_prefix.capitalize().replace("_", "")}State.successGetAll{file_name_prefix.capitalize().replace("_", "")}s(success),
    );
}}

// Get {file_name_prefix.capitalize().replace("_", "")} by id
Future<void> get{file_name_prefix.capitalize().replace("_", "")}ById(int id) async {{
    state = const {file_name_prefix.capitalize().replace("_", "")}State.loadingGet{file_name_prefix.capitalize().replace("_", "")}ById();
    final result = await _{file_name_prefix.replace("_", "")}Repository.get{file_name_prefix.capitalize().replace("_", "")}ById(id);
    result.fold(
      (failure) => state = {file_name_prefix.capitalize().replace("_", "")}State.failureGet{file_name_prefix.capitalize().replace("_", "")}ById(failure),
      (success) => state = {file_name_prefix.capitalize().replace("_", "")}State.successGet{file_name_prefix.capitalize().replace("_", "")}ById(success),
    );
}}

// Update {file_name_prefix.capitalize().replace("_", "")}
Future<void> update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Domain  {file_name_prefix.replace("_", "")}Domain) async {{
    state = const {file_name_prefix.capitalize().replace("_", "")}State.loadingUpdate{file_name_prefix.capitalize().replace("_", "")}();
    final result = await _{file_name_prefix.replace("_", "")}Repository.update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.replace("_", "")}Domain);
    result.fold(
      (failure) => state = {file_name_prefix.capitalize().replace("_", "")}State.failureUpdate{file_name_prefix.capitalize().replace("_", "")}(failure),
      (success) => state = {file_name_prefix.capitalize().replace("_", "")}State.successUpdate{file_name_prefix.capitalize().replace("_", "")}(success),
    );
}}

// Delete {file_name_prefix.capitalize().replace("_", "")}
Future<void> delete{file_name_prefix.capitalize().replace("_", "")}(int id) async {{
    state = const {file_name_prefix.capitalize().replace("_", "")}State.loadingDelete{file_name_prefix.capitalize().replace("_", "")}();
    final result = await _{file_name_prefix.replace("_", "")}Repository.delete{file_name_prefix.capitalize().replace("_", "")}(id);
    result.fold(
      (failure) => state = {file_name_prefix.capitalize().replace("_", "")}State.failureDelete{file_name_prefix.capitalize().replace("_", "")}(failure),
      (success) => state = {file_name_prefix.capitalize().replace("_", "")}State.successDelete{file_name_prefix.capitalize().replace("_", "")}(),
    );
}}
}}'''
    create_file(dir_path, file_name_prefix, suffix, content)
