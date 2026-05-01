import 'package:expense_tracker/shared/domain/entities/category_type.dart';
import 'package:get/get.dart';

class CategorySelectedController extends GetxController {
  Rx<CategoryType> categoryName = CategoryType.dining.obs;

  void setCategory({required CategoryType name}) {
    categoryName.value = name;
  }
}
