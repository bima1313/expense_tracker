import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/home/data/datasource/note_local_data_source.dart';
import 'package:expense_tracker/features/home/data/models/note_model.dart';
import 'package:expense_tracker/features/home/presentation/widgets/note_item.dart';
import 'package:expense_tracker/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MockLocalSourceImpl().getNotes(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              final data = snapshot.data as Iterable<NoteModel>;
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.neutral,
                  borderRadius: const .all(.circular(16.0)),
                ),
                child: Padding(
                  padding: const .all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final element = data.elementAt(index);
                      return NoteItem(
                        title: element.title,
                        simpleDescription: element.simpleDescription,
                        category: CategoryType.values.byName(element.iconName),
                        time: DateTime.now(),
                        amount: element.amount,
                      );
                    },
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          default:
            return const Padding(
              padding: .only(top: 32.0),
              child: Center(child: CircularProgressIndicator()),
            );
        }
      },
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(name: "Note List Widget", theme: lightTheme)
Widget noteListWidgetPreview() => const NoteList();
