import 'dart:async';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clean_architecture/core/navigation/app_router.dart';
import 'package:my_clean_architecture/generated/locale_keys.g.dart';

import '../../../core/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  String? path;
  late StreamSubscription subscription;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(navigatorObservers: () => [ChuckerFlutter.navigatorObserver]),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: LocaleKeys.title,
            debugShowCheckedModeBanner: false,
            // /themeMode: Provider.of<ThemeProviderNotifier>(context).themeMode,
            theme: APP_THEME(context),
            darkTheme: APP_THEME_DARK(context),
          );
        },
      ),
    );
  }
}
