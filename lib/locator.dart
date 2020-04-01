import 'package:get_it/get_it.dart';

import 'services/auth_service.dart';

GetIt getIt = GetIt.instance;

setupLocator() {
  getIt.registerSingleton(AuthService());
}
