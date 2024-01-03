import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/common/models/user_model.dart';
import 'package:task_manager/common/routes/routes.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/features/auth/controllers/user_controller.dart';
import 'package:task_manager/features/onboarding/pages/onboarding.dart';
import 'package:task_manager/features/todo/pages/homepage.dart';
import 'package:task_manager/features/todo/pages/view_notes.dart';
import 'package:task_manager/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<UserModel> users = ref.watch(userProvider);
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
              home: users.isEmpty
                  ? const OnBoarding()
                  : const NotificationsPage(),
              onGenerateRoute: Routes.onGenerateRoute,
            );
          });
        });
  }
}
