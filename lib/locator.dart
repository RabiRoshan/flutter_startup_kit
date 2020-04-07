import 'package:get_it/get_it.dart';

import 'services/api/fake.dart';
import 'services/api/http.dart';
import 'services/auth_service.dart';
import 'utils/secure_storage_helper.dart';
import 'utils/shared_preferences_helper.dart';

GetIt getIt = GetIt.instance;

setupLocator({bool useFakeApi = false}) {
  getIt.registerSingleton(SharedPreferencesHelper());
  getIt.registerSingleton(SecureStorageHelper());
  getIt.registerSingleton(useFakeApi ? FakeApi() : HttpApi());
  getIt.registerSingleton(AuthService());
}
