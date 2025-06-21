import 'package:my_clean_architecture/core/constants/environment_config.dart';
import 'init_app.dart';

Future<void> main() async {
  EnvironmentConfig.flavor = Flavor.production;
  await initApp();
}
