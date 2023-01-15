import 'package:emmanuel_rhythms_app/common/log_service.dart';
import 'package:emmanuel_rhythms_app/repositories/daily_content_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/resource_repository.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/resources_view_model.dart';
import 'package:get_it/get_it.dart';

class Dependencies {

  static register() {

    GetIt.I.registerSingleton<DailyContentRepository>(FirebaseDailyContentRepository());
    GetIt.I.registerSingleton<ResourceRepository>(FirebaseResourceRepository());
    GetIt.I.registerSingleton<LogService>(DebugPrintLogService());


    GetIt.I.registerFactory<HomeViewModel>(() => HomeViewModel(GetIt.I.get()));
    GetIt.I.registerFactory<ResourcesViewModel>(() => ResourcesViewModel(GetIt.I.get()));

  }
}