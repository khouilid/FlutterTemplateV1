from utils import create_file
import os

def generate_domain_files(parent_dir):
    dir_path = os.path.join(parent_dir, "domain")
    file_name_prefix = parent_dir

    suffix = "_domain.dart"
    content = f''' 
import 'package:freezed_annotation/freezed_annotation.dart';
part "{file_name_prefix}_domain.freezed.dart";

@freezed
class {file_name_prefix.capitalize().replace("_", "")}Domain with _${
        file_name_prefix.capitalize().replace("_", "")
    }Domain {{
const {file_name_prefix.capitalize().replace("_", "")}Domain._();
const factory {file_name_prefix.capitalize().replace("_", "")}Domain({{
required int id,
required String title,}})= _{file_name_prefix.capitalize().replace("_", "")}Domain;

factory {file_name_prefix.capitalize().replace("_", "")}Domain.empty()=> {file_name_prefix.capitalize().replace("_", "")}Domain(
id: 0,
title: "",
);
}}'''
    create_file(dir_path, file_name_prefix, suffix, content)
