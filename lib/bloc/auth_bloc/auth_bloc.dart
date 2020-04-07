import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../locator.dart';
import '../../models/error_response.dart';
import '../../repositories/repos.dart';
import '../../repositories/user_repo.dart';
import '../../utils/logger.dart';
import '../../utils/secure_storage_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Logger Head value
  final logger = getLogger("AuthBloc()");

  // Secure Storage Helper
  final _secureStorageHelper = getIt<SecureStorageHelper>();

  // User Repository
  final UserRepo userRepo = getIt<Repos>().userRepo;

  AuthBloc() {
    logger.i("Constructed");
  }

  @override
  AuthState get initialState => UninitializedState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthenticatingState();

    try {
      if (event is AutoLoginEvent) {
        var authToken = await _secureStorageHelper.getAuthToken();
        if (authToken != null)
          yield AuthenticatedState(authToken);
        else
          yield UnauthenticatedState();
      } else if (event is LoginEvent) {
        final loginReponse =
            await userRepo.userLogin(event.email, event.password);
        await _secureStorageHelper.setAuthToken(loginReponse.token);
        yield AuthenticatedState(loginReponse.token);
      } else if (event is LogoutEvent) {
        await _secureStorageHelper.deleteAll();
        yield UnauthenticatedState();
      }
    } on ErrorResponse catch (e) {
      yield AuthFailedState(e);
      yield UnauthenticatedState();
    } catch (error) {
      logger.e(" ${error.message}");
      yield UnauthenticatedState();
    }
  }
}
