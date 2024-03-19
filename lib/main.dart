import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/all_girls_cubit/all_girls_cubit.dart';
import 'package:livefriend/bloc/followed_girls_cubit/followed_girls_cubit.dart';
import 'package:livefriend/bloc/new_cubit/new_girl_cubit.dart';
import 'package:livefriend/bloc/popular_cubit/popular_cubit.dart';
import 'package:livefriend/bloc/talktime_cubit/talktime_cubit.dart';
import 'package:livefriend/bloc/top_rated_cubit/top_rated_cubit.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/http_override.dart';
import 'package:livefriend/common/navigator_helper.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/screens/dashboard/dashboard_screen.dart';
import 'package:livefriend/screens/login/mobile_login.dart';
import 'package:livefriend/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceUtils.init();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TopRatedCubit(),
        ),
        BlocProvider(
          create: (_) => AllGirlsCubit(),
        ),
        BlocProvider(
          create: (_) => FollowedGirlsCubit(),
        ),
        BlocProvider(
          create: (_) => NewGirlCubit(),
        ),
        BlocProvider(
          create: (_) => PopularCubit(),
        ),
        BlocProvider(
          create: (_) => TalktimeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        title: Constants.appName,
        theme: ThemeData(
            brightness:
                MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                    .platformBrightness),
        // theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        routes: {
          Constants.splashPath: (_) => const SplashScreen(),
          Constants.loginPath: (_) => const LoginScreen(),
          Constants.dashboardPath: (_) => const DashboardScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}
