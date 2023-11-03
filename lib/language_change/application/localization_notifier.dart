import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/localization_repository.dart';

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier(this._repository) : super(const Locale('fr'));

  final LocalizationRepository _repository;

  Future<void> getLocale() async {
    final locale = await _repository.getLocale();
    if (locale == null) {
      state = const Locale('fr');
    } else {
      state = locale;
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (locale == state) {
      return;
    }
    state = locale;
    return _repository.setLocale(locale);
  }
}
