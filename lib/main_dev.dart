import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:my_clean_architecture/core/constants/environment_config.dart';

import 'init_app.dart';

Future<void> main() async {
  ChuckerFlutter.showOnRelease = true;
  EnvironmentConfig.flavor = Flavor.development;
  initApp();
}
