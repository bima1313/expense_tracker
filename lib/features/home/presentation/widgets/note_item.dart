import 'package:expense_tracker/features/home/presentation/utils/category_ui_mapper.dart';
import 'package:expense_tracker/shared/domain/entities/category_type.dart';
import 'package:expense_tracker/shared/utils/datetime_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.title,
    required this.simpleDescription,
    required this.category,
    required this.time,
    required this.amount,
  });
  final String title;
  final String simpleDescription;
  final CategoryType category;
  final DateTime time;
  final double amount;
  @override
  Widget build(BuildContext context) {
    final NumberFormat currency = NumberFormat.currency(symbol: "\$");
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: category.color,
                borderRadius: const .all(.circular(24.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(category.icon, color: Colors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const .only(left: 8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "${time.toHour()}· $simpleDescription",
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "-${currency.format(amount)}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@Preview(name: "Note Item Widget")
Widget noteItemWidgetPreview() => NoteItem(
  title: "Artisan Roasters",
  simpleDescription: "Clothing",
  category: CategoryType.dining,
  time: DateTime.now(),
  amount: 13.40,
);
