import 'package:envied/envied.dart';

part 'env.g.dart';

// ignore: avoid_classes_with_only_static_members
@Envied(path: '.env.dev')
abstract class DevEnv {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _DevEnv.baseUrl;

  @EnviedField(varName: 'ENCRYPTION_KEY', obfuscate: true)
  static final String encryptKey = _DevEnv.encryptKey;
}

// ignore: avoid_classes_with_only_static_members
@Envied(path: '.env.prod')
abstract class ProdEnv {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _ProdEnv.baseUrl;

  @EnviedField(varName: 'ENCRYPTION_KEY', obfuscate: true)
  static final String encryptKey = _ProdEnv.encryptKey;
}
