import 'package:expense_tracker/features/home/data/datasource/note_local_data_source.dart';
import 'package:expense_tracker/features/home/data/repositories/note_repository_impl.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';
import 'package:expense_tracker/features/home/domain/usecase/get_notes_usecase.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/get_notes_controller.dart';
import 'package:expense_tracker/features/home/presentation/getx/controllers/real_time_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteLocalDataSource>(() => MockLocalSourceImpl());
    Get.lazyPut<NoteRepository>(
      () => NoteRepositoryImpl(localDataSource: Get.find()),
    );
    Get.lazyPut(() => GetNotesUsecase(repository: Get.find()));
    Get.lazyPut(() => GetNotesController(getNotesUsecase: Get.find()));
    Get.lazyPut(() => RealTimeController());
  }
}
