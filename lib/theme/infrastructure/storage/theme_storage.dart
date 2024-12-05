abstract class ThemeStorage {
  Future<bool?> read();
  Future<void> save({required bool isDark});
  Future<void> clear();
}
