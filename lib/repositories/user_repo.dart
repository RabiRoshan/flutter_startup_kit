import '../locator.dart';
import '../models/login_response.dart';
import '../models/user.dart';
import '../utils/http_helper.dart';
import '../utils/logger.dart';

abstract class UserRepo {
  Future<User> getUser();
  Future<LoginResponse> userLogin(String email, String password);
}

class UserFakeRepo implements UserRepo {
  // Logger Head value
  final logger = getLogger("UserFakeRepo()");

  UserFakeRepo() {
    logger.i('Constructed');
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<LoginResponse> userLogin(String email, String password) {
    // TODO: implement userLogin
    return null;
  }
}

class UserHttpRepo implements UserRepo {
  // Logger Head value
  final logger = getLogger("UserHttpRepo()");

  // Http Helper
  HttpHelper _httpHelper = getIt<HttpHelper>();

  UserHttpRepo() {
    logger.i('Constructed');
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<LoginResponse> userLogin(String email, String password) async {
    return loginResponseFromJson((await _httpHelper.makeRestCall(
            RestType.POST, "login",
            payload: {"email": email, "password": password},
            authenticated: false))
        .body);
  }
}
