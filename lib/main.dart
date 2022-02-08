import 'package:flutter/material.dart';
import 'package:steamy_draw/presentation/pages/home/home_page.dart';
import 'package:steamy_draw/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appName,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: AppColors.primary,
          primaryVariant: AppColors.primary,
          secondary: AppColors.secondary,
          secondaryVariant: AppColors.secondary,
          surface: AppColors.secondary,
          background: AppColors.secondary,
          error: AppColors.error,
          onPrimary: AppColors.onPrimary,
          onSecondary: AppColors.onSecondary,
          onSurface: AppColors.onSecondary,
          onBackground: AppColors.onSecondary,
          onError: AppColors.onError,
          brightness: Brightness.light,
        ),
        fontFamily: 'IranSans',
      ),
      home: const HomePage(),
    );
  }
}
