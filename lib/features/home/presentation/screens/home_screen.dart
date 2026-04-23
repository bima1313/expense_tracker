import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:expense_tracker/features/home/presentation/widgets/card_header.dart';
import 'package:expense_tracker/features/home/presentation/widgets/note_list.dart';
import 'package:expense_tracker/features/home/presentation/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text("current session".toUpperCase()),
              const TimeWidget(),
              const Padding(
                padding: .symmetric(vertical: 16.0),
                child: CardHeader(title: "Today's Outflow", amount: 142.50),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Today's Note",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: .bold,
                    ),
                  ),
                  TextButton(child: Text("View All"), onPressed: () {}),
                ],
              ),
              const NoteList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.mode_edit),
        label: const Text("New Note"),
        onPressed: () {},
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(size: Size(360, 800), name: "Home Screen Preview", theme: lightTheme)
Widget homeScreenPreview() {
  return GetMaterialApp(
    getPages: [
      GetPage(
        name: "/",
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
    ],
  );
}
