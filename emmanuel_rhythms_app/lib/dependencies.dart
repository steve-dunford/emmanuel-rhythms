import 'package:audio_service/audio_service.dart';
import 'package:emmanuel_rhythms_app/common/audio_handler.dart';
import 'package:emmanuel_rhythms_app/common/log_service.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/daily_content_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/notifications_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/podcast_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/resource_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/tags_repository.dart';
import 'package:emmanuel_rhythms_app/view_models/church_selection_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/notification_consent_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/resource_categories_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/resources_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/tags_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {

  static bool areDependenciesRegistered = false;

  static Future<void> register() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final audioHandler = await AudioService.init(
      builder: () => ELRAudioHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.emmanuel.rhythms.channel.audio',
        androidNotificationChannelName: 'Emmanuel Life Rhythms',
      ),
    );

    GetIt.I.registerSingleton<SharedPreferences>(_sharedPreferences);
    GetIt.I.registerSingleton<ELRAudioHandler>(audioHandler);
    GetIt.I.registerSingleton<AnalyticsRepository>(FirebaseAnalyticsRepository());
    GetIt.I.registerSingleton<DailyContentRepository>(FirebaseDailyContentRepository());
    GetIt.I.registerSingleton<ResourceRepository>(FirebaseResourceRepository());
    GetIt.I.registerSingleton<TagsRepository>(FirebaseTagsRepository());
    GetIt.I.registerSingleton<NotificationsRepository>(FirebaseNotificationsRepository());
    GetIt.I.registerSingleton<LocalStorageRepository>(SharedPreferencesLocalStorageRepository(GetIt.I.get()));
    GetIt.I.registerSingleton<PodcastRepository>(TransistorFMPodcastRepository());
    GetIt.I.registerSingleton<LogService>(DebugPrintLogService());


    GetIt.I.registerFactory<NotificationConsentViewModel>(() => NotificationConsentViewModel(GetIt.I.get()));
    GetIt.I.registerFactory<HomeViewModel>(() => HomeViewModel(GetIt.I.get(), GetIt.I.get(), GetIt.I.get()));
    GetIt.I.registerFactory<ResourceCategoriesViewModel>(() => ResourceCategoriesViewModel(GetIt.I.get()));
    GetIt.I.registerFactory<ResourcesViewModel>(() => ResourcesViewModel(GetIt.I.get(), GetIt.I.get()));
    GetIt.I.registerFactory<ChurchSelectionViewModel>(() => ChurchSelectionViewModel(GetIt.I.get()));
    GetIt.I.registerFactory<TagsViewModel>(() => TagsViewModel(GetIt.I.get()));

    areDependenciesRegistered = true;
  }
}