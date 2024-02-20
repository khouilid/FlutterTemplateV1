import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '/core/presentation/routes/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        context.router.replace(PostsListScreen());
      });
    });

    return const Scaffold(
        key: Key('splash_page'),
        body: Center(
          child: Text("Splash Page"),
        ));
  }
}
