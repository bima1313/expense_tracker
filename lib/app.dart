import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:expense_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      theme: AppTheme.lightTheme,
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
