
import 'package:emmanuel_rhythms_cms/common/log_service.dart';
import 'package:emmanuel_rhythms_cms/repositories/auth_repository.dart';
import 'package:emmanuel_rhythms_cms/repositories/file_repository.dart';
import 'package:emmanuel_rhythms_cms/repositories/daily_content_repository.dart';
import 'package:emmanuel_rhythms_cms/repositories/resources_repository.dart';
import 'package:emmanuel_rhythms_cms/view_models/auth_model.dart';
import 'package:get_it/get_it.dart';

class Dependencies {

  static register() {

    GetIt.I.registerSingleton<DailyContentRepository>(FirebaseDailyContentRepository());
    GetIt.I.registerSingleton<ResourcesRepository>(FirebaseResourcesRepository());
    GetIt.I.registerSingleton<FileRepository>(FirebaseFileRepository());

    GetIt.I.registerSingleton<LogService>(DebugPrintLogService());
    GetIt.I.registerSingleton<AuthRepository>(FirebaseAuthRepository(GetIt.I.get()));

    GetIt.I.registerSingleton<AuthModel>(AuthModel(GetIt.I.get()));
  }
}