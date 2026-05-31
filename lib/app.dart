import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/history/presentation/getx/bindings/history_binding.dart';
import 'package:expense_tracker/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:expense_tracker/features/main_layout/presentation/getx/bindings/main_binding.dart';
import 'package:expense_tracker/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      theme: AppTheme.lightTheme,
      smartManagement: .keepFactory,
      getPages: [
        GetPage(
          name: "/",
          page: () => const MainLayoutScreen(),
          bindings: [MainBinding(), HomeBinding(), HistoryBinding()],
        ),
      ],
    );
  }
}
