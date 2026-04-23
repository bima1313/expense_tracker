import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:expense_tracker/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:get/get.dart';

class GetNotesController extends GetxController {
  final GetNotesUsecase getNotesUsecase;
  RxList<Note> getNotes = <Note>[].obs;
  RxBool isLoading = false.obs;
  GetNotesController({required this.getNotesUsecase});

  Future<void> getData() async {
    isLoading.value = true;
    final data = await getNotesUsecase();
    getNotes.value = data;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
