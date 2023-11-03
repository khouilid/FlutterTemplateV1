import 'package:encrypt/encrypt.dart';

import '../../config/environment.dart';

final _key = Key.fromUtf8(encryptKey);
final _iv = IV.fromLength(16);

final _encrypter = Encrypter(AES(_key));

String encrypt(String value) => _encrypter.encrypt(value, iv: _iv).base64;

String decrypt(String value) =>
    _encrypter.decrypt(Encrypted.from64(value), iv: _iv);
