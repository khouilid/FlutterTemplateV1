import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../language_change/shared/providers.dart';
import '../../theme/shared/dark_theme.dart';
import '../../theme/shared/light_theme.dart';
import '../../theme/shared/providers.dart';
import '../shared/providers.dart';
import 'managers/strings_manager.dart';

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  Theme? mode;

  final initializationProvider = FutureProvider<Unit>(
    (ref) async {
      
      /// Initialize the Theme when the app starts. We do this here to
      await ref.read(themeNotifierProvider.notifier).getThemeMode();

      /// Initialize the Localization when the app starts. We do this here to
      await ref.read(localizationNotifierProvider.notifier).getLocale();

      /// Initialize the database when the app starts. We do this here to
      await ref.read(isarDatabaseProvider).init();

      return unit;
    },
  );

  @override
  Widget build(BuildContext context) {

   
    /// this is the localization provider that we created in the [language_change_provider.dart] file.
    final localizationProvider = ref.watch(localizationNotifierProvider);

    /// this is the theme provider that we created in the [theme_provider.dart] file.
    final themeProvider = ref.watch(themeNotifierProvider);


    /// this is the app router that we created in the [app_router.dart] file.
    final appRouter = ref.watch(appRouterProvider);


    /// We use the [ref.listen] method to listen to the changes in the [initializationProvider] provider.
    ref.listen(
      initializationProvider,
      (_, __) {},
    );

    return MaterialApp.router(
      title: StringsManager.appName, // This is the app name that we created in the [strings_manager.dart] file.
      theme: themeProvider == ThemeMode.system ? lightTheme : darkTheme,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          breakpoints: const [
            Breakpoint(start: 0, end: 480, name: MOBILE),
            Breakpoint(start: 481, end: 1200, name: TABLET),
            Breakpoint(start: 1201, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localizationProvider, // This is the localization provider that we created in the [language_change_provider.dart] file.
    );
  }
}
