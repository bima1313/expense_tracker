import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.title, required this.amount});
  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(
      decimalDigits: 2,
      locale: "en_US",
      symbol: "\$",
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                title.toUpperCase(),
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(color: Colors.white, fontWeight: .bold),
              ),
              Text(
                currency.format(amount),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Card Header Widget", theme: lightTheme)
Widget previewCardHeaderWidget() {
  return const SizedBox(
    width: 200,
    height: 100,
    child: CardHeader(title: "Today's Outflow", amount: 142.50),
  );
}
