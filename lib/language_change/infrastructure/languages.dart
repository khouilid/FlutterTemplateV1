import '../../gen/assets.gen.dart';

import '../domain/app_language.dart';

final languages = <AppLanguage>[
  AppLanguage(title: 'Français', languageCode: 'fr', flag: Assets.icons.languages.france.path),
  AppLanguage(title: 'English', languageCode: 'en', flag: Assets.icons.languages.english.path),
  AppLanguage(title: 'Nederlands', languageCode: 'nl', flag: Assets.icons.languages.nederlands.path),
  AppLanguage(title: 'Español', languageCode: 'es', flag: Assets.icons.languages.spain.path),
  AppLanguage(title: 'Deutsch', languageCode: 'de', flag: Assets.icons.languages.germany.path),
];
