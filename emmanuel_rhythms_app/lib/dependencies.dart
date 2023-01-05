import 'package:emmanuel_rhythms_app/common/log_service.dart';
import 'package:emmanuel_rhythms_app/repositories/item_repository.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:get_it/get_it.dart';

class Dependencies {

  static register() {

    GetIt.I.registerSingleton<ItemRepository>(FirebaseItemRepository());
    GetIt.I.registerSingleton<LogService>(DebugPrintLogService());


    GetIt.I.registerFactory<HomeViewModel>(() => HomeViewModel(GetIt.I.get()));

  }
}