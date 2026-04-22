import 'dart:async';

import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/home/presentation/widgets/card_header.dart';
import 'package:expense_tracker/features/home/presentation/widgets/note_list.dart';
import 'package:expense_tracker/shared/utils/datetime_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  DateTime dateTime = DateTime.now();
  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              Text(
                dateTime.toDate(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: .bold,
                ),
              ),
              Text(
                dateTime.toHour(),
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(color: Colors.black),
              ),
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
Widget homeScreenPreview() => const HomeScreen();
