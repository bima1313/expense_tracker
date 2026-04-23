import 'dart:async';

import 'package:expense_tracker/shared/utils/datetime_parser.dart';
import 'package:get/get.dart';

class RealTimeController extends GetxController {
  RxString currentDate = DateTime.now().toDate().obs;
  RxString currentTime = DateTime.now().toHour().obs;

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      currentDate.value = DateTime.now().toDate();
      currentTime.value = DateTime.now().toHour();
    });
    super.onInit();
  }
}
