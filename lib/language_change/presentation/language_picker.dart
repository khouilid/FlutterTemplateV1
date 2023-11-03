import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../core/presentation/utils/functions.dart';
import '../domain/app_language.dart';
import '../infrastructure/languages.dart';
import '../shared/providers.dart';

class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isDesktop || isAndroid) {
      return DropdownButton<AppLanguage>(
        items: languages
            .map(
              (language) => DropdownMenuItem<AppLanguage>(
                value: language,
                child: Row(
                  children: [
                    const SizedBox(height: 12),
                    Text(language.title),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (language) => ref.read(localizationNotifierProvider.notifier).setLocale(
              Locale(language!.languageCode),
            ),
        value: languages
            .where(
              (element) => Locale(element.languageCode) == ref.watch(localizationNotifierProvider),
            )
            .toList()
            .first,
        alignment: AlignmentDirectional.center,
      );
    } else {
      //TODO make one for macOs and iOS
      return DropdownButton<AppLanguage>(
        items: languages
            .map(
              (language) => DropdownMenuItem<AppLanguage>(
                value: language,
                child: Row(
                  children: [
                    const SizedBox(height: 12),
                    Text(language.title),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (language) => ref.read(localizationNotifierProvider.notifier).setLocale(
              Locale(language!.languageCode),
            ),
        value: languages
            .where(
              (element) => Locale(element.languageCode) == ref.watch(localizationNotifierProvider),
            )
            .toList()
            .first,
        alignment: AlignmentDirectional.center,
      );
    }
  }
}
