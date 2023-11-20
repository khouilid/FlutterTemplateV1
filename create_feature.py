import os
import sys



# Check if the parent directory name and file name prefix are provided as command-line arguments
if len(sys.argv) != 3:
    print("Usage: python create_feature.py <folder> <parent_dir_name>")
    sys.exit(1)


folder = sys.argv[1]

if folder == "/":
    folder = ""

finalFolder = ''f'./lib/{folder}''';

os.chdir(''f'{finalFolder}''')




# Get the parent directory name and file name prefix from the command-line arguments
parent_dir = sys.argv[2]


file_name_prefix = parent_dir 


# Create the parent directory if it doesn't exist
if not os.path.exists(parent_dir):
    os.mkdir(parent_dir)

# Define the subdirectories
subdirs = ["application", "infrastructure", "presentation", "shared", "domain"]


def create_file(directory, prefix, suffix, content):
    
    file_name = f"{prefix.lower()}{suffix}"
    file_path = os.path.join(directory, file_name)
    with open(file_path, "w") as file:
        file.write(content)


# Iterate through the subdirectories
for subdir in subdirs:
    dir_path = os.path.join(parent_dir, subdir)
    os.mkdir(dir_path)
  

    # Generate files only in the "application" directory
    if subdir == "application":
        suffix = "_states.dart"
        content = ''' 
        
import 'package:freezed_annotation/freezed_annotation.dart';
part "'''f'{file_name_prefix}''''_states.freezed.dart" ;

@freezed
class '''f'{file_name_prefix.capitalize().replace("_","")}''''State with _$'''f'{file_name_prefix.capitalize().replace("_","")}''''State  
{
const '''f'{file_name_prefix.capitalize().replace("_","")}''''State._(); 
const factory '''f'{file_name_prefix.capitalize().replace("_","")}''''State.loading() = _Loading;
const factory '''f'{file_name_prefix.capitalize().replace("_","")}''''State.initial() = _Initial;
const factory '''f'{file_name_prefix.capitalize().replace("_","")}''''State.failure() = _Failure;
}'''

        create_file(dir_path, file_name_prefix, suffix, content)


    # Generate files only in the "application" directory
    if subdir == "application":
        suffix = "_notifire.dart"
        content = ''' 

import 'package:hooks_riverpod/hooks_riverpod.dart';
import "'''f'{file_name_prefix}''''_states.dart";
import '../infrastructure/repository/'''f'{file_name_prefix}''''_repository.dart';

class '''f'{file_name_prefix.capitalize().replace("_","")}''''StateNotifier extends StateNotifier<'''f'{file_name_prefix.capitalize().replace("_","")}''''State> {

final '''f'{file_name_prefix.capitalize().replace("_","")}''''Repository  _'''f'{file_name_prefix.replace("_","")}''''Repository;

'''f'{file_name_prefix.capitalize().replace("_","")}''''StateNotifier(this._'''f'{file_name_prefix.replace("_","")}''''Repository) : super(const '''f'{file_name_prefix.capitalize().replace("_","")}''''State.initial());

        }'''

        create_file(dir_path, file_name_prefix, suffix, content)


    # Generate files only in the "infrastructure" directory
    if subdir == "infrastructure":
        os.mkdir(dir_path + "/repository")
        os.mkdir(dir_path + "/remote")
        suffix = "_repository.dart"
        content = ''' 

import "../../../core/infrastructure/helpers/repository_helper.dart";
import "../remote/'''f'{file_name_prefix}''''_remote_datasource.dart";

class '''f'{file_name_prefix.capitalize().replace("_","")}''''Repository with RepositoryHelper {

final '''f'{file_name_prefix.capitalize().replace("_","")}''''RemoteDataSource _'''f'{file_name_prefix.replace("_","")}''''RemoteDataSource;

'''f'{file_name_prefix.capitalize().replace("_","")}''''Repository(this._'''f'{file_name_prefix.replace("_","")}''''RemoteDataSource);
  
         
}'''
       
        create_file( dir_path + "/repository" , file_name_prefix, suffix, content)


        
 # Generate files only in the "infrastructure" directory
    if subdir == "infrastructure":
        

        
        suffix = "_remote_datasource.dart"
        content = ''' 


import "'''f'{file_name_prefix}''''_services.dart";

class  '''f'{file_name_prefix.capitalize().replace("_","")}''''RemoteDataSource  {
final '''f'{file_name_prefix.capitalize().replace("_","")}''''Service _'''f'{file_name_prefix.replace("_","")}''''Service;

'''f'{file_name_prefix.capitalize().replace("_","")}''''RemoteDataSource(this._'''f'{file_name_prefix.replace("_","")}''''Service);

        
}'''


        create_file(dir_path + "/remote", file_name_prefix, suffix, content)

    if subdir == "infrastructure":
        
        suffix = "_services.dart"
        content = ''' 


import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part "'''f'{file_name_prefix}''''_services.g.dart" ;

@RestApi()
abstract class '''f'{file_name_prefix.capitalize().replace("_","")}''''Service {
  factory '''f'{file_name_prefix.capitalize().replace("_","")}''''Service(Dio dio) = _'''f'{file_name_prefix.capitalize().replace("_","")}''''Service;

        
}'''

           
        create_file(dir_path + "/remote", file_name_prefix, suffix, content)


    # Generate files only in the "shared" directory
    if subdir == "shared":
        suffix = "_providers.dart"
        content = ''' 
     
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import "../application/'''f'{file_name_prefix}''''_notifire.dart";  
import '../application/'''f'{file_name_prefix}''''_states.dart';
import '../infrastructure/remote/'''f'{file_name_prefix}''''_remote_datasource.dart';
import '../infrastructure/remote/'''f'{file_name_prefix}''''_services.dart';

import '../infrastructure/repository/'''f'{file_name_prefix}''''_repository.dart';






final '''f'{file_name_prefix.replace("_","").lower()}''''Service = Provider<'''f'{file_name_prefix.capitalize().replace("_","")}''''Service>((ref) => '''f'{file_name_prefix.capitalize().replace("_","")}''''Service(ref.watch(dioProvider)));





final '''f'{file_name_prefix.replace("_","").lower()}''''RemoteRepositoryProvider =
    Provider<'''f'{file_name_prefix.capitalize().replace("_","")}''''RemoteDataSource>(
  (ref) => '''f'{file_name_prefix.capitalize().replace("_","")}''''RemoteDataSource(ref.watch('''f'{file_name_prefix.replace("_","").lower()}''''Service)),
);


final '''f'{file_name_prefix.replace("_","").lower()}''''RepositoryProvider = Provider<'''f'{file_name_prefix.capitalize().replace("_","")}''''Repository>(
  (ref) => '''f'{file_name_prefix.capitalize().replace("_","")}''''Repository(
    ref.watch('''f'{file_name_prefix.replace("_","").lower()}''''RemoteRepositoryProvider),
  ),
);


final '''f'{file_name_prefix.replace("_","").lower()}''''NotifierProvider =
    StateNotifierProvider<'''f'{file_name_prefix.replace("_","").capitalize()}''''StateNotifier, '''f'{file_name_prefix.capitalize().replace("_","")}''''State>(
  (ref) => '''f'{file_name_prefix.replace("_","").capitalize()}''''StateNotifier(ref.watch('''f'{file_name_prefix.replace("_","").lower()}''''RepositoryProvider)),
);
'''
        create_file(dir_path, file_name_prefix, suffix, content)


    # Generate files only in the "presentation" directory
    if subdir == "presentation":
        suffix = "_page.dart"
        content = ''' 
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


        @RoutePage()
class '''f'{file_name_prefix.capitalize().replace("_","")}''''Page extends StatelessWidget {
  const '''f'{file_name_prefix.capitalize().replace("_","")}''''Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("'''f'{file_name_prefix.capitalize().replace("_","")}'''' Page"),
    ));
  }

    
}'''

        create_file(dir_path, file_name_prefix, suffix, content)



# os.chdir('..')
os.system("flutter pub run build_runner build -d")

print("Directory structure and files created successfully.")
