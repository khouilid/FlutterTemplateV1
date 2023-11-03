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
      // await ref.read(isarDatabaseProvider).init();

      return unit;
    },
  );

  @override
  Widget build(BuildContext context) {
    final localizationProvider = ref.watch(localizationNotifierProvider);
    final themeProvider = ref.watch(themeNotifierProvider);

    final appRouter = ref.watch(appRouterProvider);
    ref.listen(
      initializationProvider,
      (_, __) {},
    );

    return MaterialApp.router(
      title: StringsManager.appName,
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
      locale: localizationProvider,
    );
  }
}
