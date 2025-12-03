import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/config/cubit/theme_cubit.dart';
import 'package:fintech/core/config/theme_data/theme_data_dark.dart';
import 'package:fintech/core/config/theme_data/theme_data_light.dart';
import 'package:fintech/core/databases/cache/cache_helper.dart';
import 'package:fintech/core/di/service_locator.dart';
import 'package:fintech/core/routting/routes.dart';
import 'package:fintech/core/splash.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await CacheHelper().init();
  await EasyLocalization.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: AppAssets.translationsPath,
      fallbackLocale: const Locale('en'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => sl<AuthCubit>()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, newMode) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: getLightTheme(),
              darkTheme: getDarkTheme(),
              themeMode: newMode,
              debugShowCheckedModeBanner: false,
              initialRoute: Splash.routeName,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
