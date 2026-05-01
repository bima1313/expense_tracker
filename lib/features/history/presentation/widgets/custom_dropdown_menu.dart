import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dates = [2022, 2023, 2024];
    return DropdownMenu(
      textAlign: .center,
      textStyle: TextStyle(
        fontSize: 14.0,
        color: AppColors.primary,
        fontWeight: .bold,
      ),
      initialSelection: dates[0],
      selectOnly: true,
      inputDecorationTheme: InputDecorationTheme(
        isCollapsed: true,
        filled: true,
        border: OutlineInputBorder(
          borderSide: .none,
          borderRadius: .all(.circular(32.0)),
        ),
        fillColor: const Color.fromARGB(120, 156, 163, 175),
      ),
      menuStyle: MenuStyle(
        shape: .all(
          const RoundedRectangleBorder(borderRadius: .all(.circular(16.0))),
        ),
        visualDensity: VisualDensity.standard,
      ),
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: dates[0],
          label: dates[0].toString(),
          style: ButtonStyle(
            foregroundColor: .all(AppColors.primary),
            textStyle: .all(TextStyle(fontWeight: .bold)),
          ),
        ),
        DropdownMenuEntry(
          value: dates[1],
          label: dates[1].toString(),
          style: ButtonStyle(
            foregroundColor: .all(AppColors.primary),
            textStyle: .all(TextStyle(fontWeight: .bold)),
          ),
        ),
        DropdownMenuEntry(
          value: dates[2],
          label: dates[2].toString(),
          style: ButtonStyle(
            foregroundColor: .all(AppColors.primary),
            textStyle: .all(TextStyle(fontWeight: .bold)),
          ),
        ),
      ],
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(
  size: Size(360, 400),
  name: "custom Dropdown Menu Preview",
  theme: lightTheme,
)
Widget customDropdownMenu() {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Align(alignment: .topCenter, child: CustomDropdownMenu()),
    ),
  );
}
