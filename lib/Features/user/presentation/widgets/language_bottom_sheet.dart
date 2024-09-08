import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/presentation/utils/buttons/action_buttons.dart';
import 'package:template/language_change/infrastructure/languages.dart';
import 'package:template/language_change/shared/providers.dart';

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Change Language",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Select your preferred language",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          ...languages.map(
            (language) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ActionButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    ref.read(localizationNotifierProvider.notifier).setLocale(
                          Locale(language.languageCode),
                        );
                    context.router.pop();
                  },
                  color: Theme.of(context).colorScheme.primary,
                  action: language.title,
                  child: Text(
                    language.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
