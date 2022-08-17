import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:player/manager/page_manager.dart';
import 'package:player/services/songs_provider.dart';
import 'audio_handler.dart';
import 'notification.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<AudioHandler>(await initAudioService());
  getIt.registerLazySingleton<Songs>(() => Songs());
  getIt.registerLazySingleton<PageManager>(() => PageManager());
  getIt.registerLazySingleton<NotificatioService>(() => NotificatioService());
}
