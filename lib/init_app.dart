import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_architecture/features/app/page/app.dart';
import 'package:my_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_clean_architecture/injection_container.dart';
import 'package:provider/provider.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()..add(GetPosts())),
        ],
        child: EasyLocalization(
          supportedLocales: [
            Locale('kk'),
            Locale('ru'),
            Locale('en'),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('kk'),
          child: App(),
        ),
      ),
    ),
  );
}
