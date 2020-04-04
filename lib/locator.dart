import 'package:get_it/get_it.dart';

import 'services/api/fake.dart';
import 'services/api/http.dart';
import 'services/auth_service.dart';
import 'utils/shared_preferences_helper.dart';

GetIt getIt = GetIt.instance;
bool useFakeApi = false;

setupLocator() {
  getIt.registerSingleton(useFakeApi ? FakeApi() : HttpApi());
  getIt.registerSingleton(AuthService());
  getIt.registerSingleton(SharedPreferencesHelper());
}
