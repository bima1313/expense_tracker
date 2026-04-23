import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:expense_tracker/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:expense_tracker/features/home/presentation/widgets/note_item.dart';
import 'package:expense_tracker/shared/domain/entities/category_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class NoteList extends GetView<GetNotesController> {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Padding(
          padding: .only(top: 32.0),
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        final notes = controller.getNotes;
        return Column(
          children: [
            Container(
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
                    final element = notes.elementAt(index);
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
            ),
          ],
        );
      }
    });
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(group: "Home Screen", name: "Note List Widget", theme: lightTheme)
Widget noteListWidgetPreview() {
  return GetMaterialApp(
    getPages: [
      GetPage(name: "/", page: () => const NoteList(), binding: HomeBinding()),
    ],
  );
}
