import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/Features/notifications/shared/notifications_providers.dart';
import 'package:template/app_update/presentation/widget/app_update_dialog.dart';
import 'package:template/app_update/shared/providers.dart';
import 'package:template/Features/auth/application/auth_notifier.dart';
import 'package:template/Features/auth/shared/providers.dart';
import 'package:template/Features/user/shared/user_providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/config/environment.dart';
import 'package:template/core/infrastructure/helpers/logger_interceptor.dart';
import '../../language_change/shared/providers.dart';
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

      // Initialize the app push notifications when the app starts. We do this here to
      final notificationRepositoryN = ref.read(notificationRepositoryProvider);
      notificationRepositoryN.getToken();

      ref.read(dioProvider)
        ..options = BaseOptions(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
          validateStatus: (status) =>
              status != null && status >= 200 && status < 400,
        )
        ..interceptors.add(
          LoggingInterceptor(
            baseUrl: baseUrl,
          ),
        );

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

    ref.listen<AuthState>(
      authNotifierProvider,
      (AuthState? previous, AuthState next) {
        next.maybeMap(
          orElse: () {},
          authenticated: (_) {
            ref.read(userProvider.notifier).state = _.user;
          },
          unauthenticated: (_) {},
        );
      },
    );

    ref.listen(appUpdateNotifierProvider, (previous, next) {
      next.maybeMap(
          orElse: () {},
          hasAnUpdate: (_) {
            if (_.appUpdateStatusModel.updateAvailable &&
                _.appUpdateStatusModel.optional) {
              updateDialog(context, _.appUpdateStatusModel);
            }
            if (_.appUpdateStatusModel.updateAvailable &&
                !_.appUpdateStatusModel.optional) {}
          });
    });

    return ScreenUtilInit(
        minTextAdapt: true,
        child: MaterialApp.router(
          title: StringsManager.appName,
          builder: (context, child) {
            return Toast(navigatorKey: appRouter.navigatorKey, child: child!);
          },
          theme: lightTheme.copyWith(
            extensions: [
              FlashToastTheme(
                backgroundColor: Colors.black87,
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ],
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localizationProvider,
        ));
  }
}
