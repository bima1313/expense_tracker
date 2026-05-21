import 'package:expense_tracker/features/home/data/mocks/datasource/note_local_data_source_preview.dart';
import 'package:expense_tracker/features/home/data/mocks/repositories/note_repository_impl_preview.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';
import 'package:expense_tracker/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:get/get.dart';

class HomeBindingPreview extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteLocalDataSourcePreview>(() => MockLocalSourceImplPreview());
    Get.lazyPut<NoteRepository>(
      () => NoteRepositoryImplPreview(localDataSource: Get.find()),
    );

    // get notes usecase
    Get.lazyPut(() => GetNotesUsecase(repository: Get.find()));
    Get.lazyPut(() => GetNotesController(getNotesUsecase: Get.find()));

    Get.lazyPut(() => RealTimeController());
  }
}
