import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/features/home/presentation/getx/bindings/home_binding.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:get/get.dart';

class TimeWidget extends GetView<RealTimeController> {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "${controller.currentDate}",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: .bold,
            ),
          ),
          Text(
            "${controller.currentTime}",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(color: Colors.black),
          ),
        ],
      );
    });
  }
}

@Preview(group: "Home Screen", name: "Time Widget Preview")
Widget timeWidgetPreview() {
  return GetMaterialApp(
    getPages: [
      GetPage(
        name: "/",
        page: () => const TimeWidget(),
        binding: HomeBinding(),
      ),
    ],
  );
}
