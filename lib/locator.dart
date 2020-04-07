import 'package:get_it/get_it.dart';

import 'repositories/repos.dart';
import 'utils/http_helper.dart';
import 'utils/secure_storage_helper.dart';
import 'utils/shared_preferences_helper.dart';

GetIt getIt = GetIt.instance;

setupLocator({bool useFakeRepo = false}) {
  getIt.registerSingleton(SharedPreferencesHelper());
  getIt.registerSingleton(SecureStorageHelper());
  getIt.registerSingleton(HttpHelper());

  if (useFakeRepo) {
    getIt.registerSingleton(Repos.fake());
  } else {
    getIt.registerSingleton(Repos.http());
  }
}
