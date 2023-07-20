import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/features/onboarding/pages/onboarding_page.dart';
import 'package:bloc_clean_arxitectura/features/todo/pages/home_page.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorSchame =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorSchame = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorSchame, darkColorSchame) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: AppConst.kBKDark,
          colorScheme: lightColorSchame ?? defaultDarkColorSchame,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: AppConst.kBKDark,
          colorScheme: darkColorSchame??defaultDarkColorSchame,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        home: const HomePage(),
      );
    });
  }
}
