import 'package:flutter/material.dart';

abstract class LocaleStorage {
  Future<Locale?> read();
  Future<void> save(Locale locale);
  Future<void> clear();
}
