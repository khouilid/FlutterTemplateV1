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

    
    suffix = "_list_page.dart"
    content = f''' 
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/presentation/managers/color_manager.dart';
import '../shared/{file_name_prefix}_providers.dart';
import '../application/{file_name_prefix}_states.dart';


@RoutePage()
class {file_name_prefix.capitalize().replace("_", "")}ListPage extends ConsumerStatefulWidget {{
  const {file_name_prefix.capitalize().replace("_", "")}ListPage({{Key? key}}) : super(key: key);

  @override
  ConsumerState createState() => _{file_name_prefix.capitalize().replace("_", "")}ListState();
}}


class _{file_name_prefix.capitalize().replace("_", "")}ListState  extends ConsumerState<{file_name_prefix.capitalize().replace("_", "")}ListPage> {{

 @override
  void initState() {{
    super.initState();
    Future.microtask(() => ref.read({file_name_prefix.replace("_", "").lower()}NotifierProvider.notifier).getAll{file_name_prefix.capitalize().replace("_", "")}s());
  }}

  Future<void> _onRefresh() async => Future.microtask(
      () => ref.read({file_name_prefix.replace("_", "").lower()}NotifierProvider.notifier).getAll{file_name_prefix.capitalize().replace("_", "")}s());


  @override
  Widget build(BuildContext context) {{
      
    ref.listen<{file_name_prefix.capitalize().replace("_", "")}State>(
      {file_name_prefix.replace("_", "").lower()}NotifierProvider,
      (previous, next) {{
        next.maybeMap(
            orElse: () {{}},
            failureGetAll{file_name_prefix.capitalize().replace("_", "")}s: (_) async {{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_.failure.message ?? "Something Went Wrong"),
                ),
              );
            }},
            successGetAll{file_name_prefix.capitalize().replace("_", "")}s: (_) async {{
              ref.watch(list{file_name_prefix.replace("_", "").capitalize()}Provider.notifier).state  =
                  _.{file_name_prefix.replace("_", "")}sDomain;
            }},
       
            
            );
      }},
    );

    final state = ref.watch({file_name_prefix.replace("_", "").lower()}NotifierProvider);
    return Scaffold(
      key: Key("{file_name_prefix.replace("_", "").lower()}_scaffold"),
      appBar: AppBar(
        title: const Text('{file_name_prefix.replace("_", "").lower()}'),
      ),
      body: state.maybeMap(
        orElse: () => const Center(
          child: CircularProgressIndicator(
            color: AppColors.chateauGreen,
          ),
        ),
        loadingGetAll{file_name_prefix.capitalize().replace("_", "")}s: (_) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.chateauGreen,
          ),
        ),
        successGetAll{file_name_prefix.capitalize().replace("_", "")}s: (_) => RefreshIndicator(
          onRefresh: _onRefresh,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _.{file_name_prefix.replace("_", "")}sDomain.length,
                  itemBuilder: (context, index) {{
                  
                  final list = _.{file_name_prefix.replace("_", "")}sDomain;
                  
                    return ListTile(
                      title: Text(list[index].title),
                      subtitle: Text(list[index].title),
                    );
                  }},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}

}}'''
    create_file(dir_path, file_name_prefix, suffix, content)