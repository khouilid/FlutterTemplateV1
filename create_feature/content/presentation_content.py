from utils import create_file
import os

def generate_presentation_files(parent_dir):
    dir_path = os.path.join(parent_dir, "presentation")
    file_name_prefix = parent_dir

    suffix = "_page.dart"
    content = f''' 
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class {file_name_prefix.capitalize().replace("_", "")}Page extends StatelessWidget {{
  const {file_name_prefix.capitalize().replace("_", "")}Page({{Key? key}}) : super(key: key);

  @override
  Widget build(BuildContext context) {{
    return const Scaffold(
        body: Center(
      child: Text("{file_name_prefix.capitalize().replace("_", "")} Page"),
    ));
  }}

}}'''
    create_file(dir_path, file_name_prefix, suffix, content)
