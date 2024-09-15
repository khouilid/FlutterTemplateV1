
import 'package:flutter/foundation.dart';
import 'package:template/core/config/env/env.dart';

String get baseUrl => kReleaseMode ? ProdEnv.baseUrl : DevEnv.baseUrl;

String get encryptKey => ProdEnv.encryptKey;