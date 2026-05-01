import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/history/presentation/widgets/chart.dart';
import 'package:expense_tracker/features/history/presentation/widgets/custom_card.dart';
import 'package:expense_tracker/features/history/presentation/widgets/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 2,
      locale: "en_US",
      symbol: "\$",
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: .start,
          children: [
            Row(
              spacing: 16.0,
              children: [
                Text("annual overview".toUpperCase()),
                CustomDropdownMenu(),
              ],
            ),
            Text(
              currency.format(84230),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black,
                fontWeight: .bold,
              ),
            ),
            Text(
              "Your total expenditure this year. A comprehensive look at the structural flow of your capital across all monitored channels.",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
            const Chart(title: "Spending Velocity", label: "Outflow"),
            Padding(
              padding: const .only(top: 24.0),
              child: Text(
                "Monthly Summaries",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: .bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            CustomCard(
              title: "December",
              description: "142 Transactions",
              amount: currency.format(8120),
              changeRate: "-4.2% from Nov",
            ),
          ],
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 800),
  name: "History Screen Preview",
  theme: lightTheme,
)
Widget histroyScreenPreview() {
  return Scaffold(
    appBar: AppBar(title: Text("Expense Tracker")),
    body: HistoryScreen(),
  );
}
