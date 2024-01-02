import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/features/todo/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
              builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              title: 'Task Management',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: AppConst.kBkDark,
                  colorScheme: lightColorScheme ?? defaultLightColorScheme,
                  useMaterial3: true),
              darkTheme: ThemeData(
                  colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                  scaffoldBackgroundColor: AppConst.kBkDark,
                  useMaterial3: true),
              themeMode: ThemeMode.dark,
              home: const Homepage(),
            );
          });
        });
  }
}
