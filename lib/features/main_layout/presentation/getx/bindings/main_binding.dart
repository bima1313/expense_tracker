import 'package:expense_tracker/features/main_layout/presentation/getx/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
