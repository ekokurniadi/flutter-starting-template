import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:instapos/app.dart';
import 'package:instapos/core/auto_route/auto_route.gr.dart';
import 'package:instapos/core/logger/bloc_event_logger.dart';
import 'package:instapos/core/styles/color_name_style.dart';
import 'package:instapos/injector.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    sqfliteFfiInit();
  }

  await configureDependencies(environment: Environment.dev);
  await App.init();

  Bloc.observer = BlocEventLogger();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 720),
      builder: (context, child) {
        return MaterialApp.router(
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ],
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: ThemeData(
            fontFamily: 'PlusJakartaSans',
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: InstaColors.primary500,
                textStyle: TextStyle(
                  fontSize: 14.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                color: InstaColors.text300,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: InstaColors.neutral100,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: InstaColors.neutral100,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: InstaColors.neutral100,
                ),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: InstaColors.primary500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                fixedSize: Size(double.infinity, 36.h),
                padding: EdgeInsets.all(8.w),
              ),
            ),
          ),
        );
      },
    );
  }
}
