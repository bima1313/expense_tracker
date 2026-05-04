import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void navigationClick({required int selectedIndex}) {
    currentIndex = selectedIndex;
    update();
  }
}
