from utils import create_file
import os

def generate_shared_files(parent_dir):
    dir_path = os.path.join(parent_dir, "shared")
    file_name_prefix = parent_dir

    suffix = "_providers.dart"
    content = f''' 
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import "../application/{file_name_prefix}_notifier.dart";  
import '../application/{file_name_prefix}_states.dart';
import '../domain/{file_name_prefix}_domain.dart';
import '../infrastructure/remote/{file_name_prefix}_remote_datasource.dart';
import '../infrastructure/repository/{file_name_prefix}_repository.dart';

final {file_name_prefix.replace("_", "").lower()}RemoteRepositoryProvider =
    Provider<{file_name_prefix.capitalize().replace("_", "")}RemoteDataSource>(
  (ref) => {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource(ref.watch(dioProvider)),
);

final {file_name_prefix.replace("_", "").lower()}RepositoryProvider = Provider<{file_name_prefix.capitalize().replace("_", "")}Repository>(
  (ref) => {file_name_prefix.capitalize().replace("_", "")}Repository(
    ref.watch({file_name_prefix.replace("_", "").lower()}RemoteRepositoryProvider),
  ),
);

final {file_name_prefix.replace("_", "").lower()}NotifierProvider =
    StateNotifierProvider<{file_name_prefix.replace("_", "").capitalize()}StateNotifier, {file_name_prefix.capitalize().replace("_", "")}State>(
  (ref) => {file_name_prefix.replace("_", "").capitalize()}StateNotifier(ref.watch({file_name_prefix.replace("_", "").lower()}RepositoryProvider)),
);


final list{file_name_prefix.replace("_", "").capitalize()}Provider =
    StateProvider<List<{file_name_prefix.capitalize().replace("_", "")}Domain>>((ref) => []);

final selected{file_name_prefix.replace("_", "").capitalize()}Provider =
   StateProvider<{file_name_prefix.capitalize().replace("_", "")}Domain>((ref) => {file_name_prefix.capitalize().replace("_", "")}Domain.empty());



'''
    create_file(dir_path, file_name_prefix, suffix, content)
