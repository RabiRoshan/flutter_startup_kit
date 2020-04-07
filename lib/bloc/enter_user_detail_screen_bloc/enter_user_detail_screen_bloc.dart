import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../locator.dart';
import '../../models/user.dart';
import '../../utils/logger.dart';
import '../../utils/shared_preferences_helper.dart';

part 'enter_user_detail_screen_event.dart';
part 'enter_user_detail_screen_state.dart';

class EnterUserDetailScreenBloc
    extends Bloc<EnterUserDetailScreenEvent, EnterUserDetailScreenState> {
  // Logger Head value
  final logger = getLogger("EnterUserDetailScreenBloc()");

  // Shared Pref Helper
  final _sharedPreferencesHelper = getIt<SharedPreferencesHelper>();

  EnterUserDetailScreenBloc() {
    logger.i("Constructed");
  }

  @override
  EnterUserDetailScreenState get initialState => EnterUserDetailScreenInitial();

  @override
  Stream<EnterUserDetailScreenState> mapEventToState(
    EnterUserDetailScreenEvent event,
  ) async* {
    yield UserDetailsLoading();

    if (event is LoadUserDetails) {
      var user = await _sharedPreferencesHelper.getLocalUserData();
      yield UserDetailsLoaded(user);
    } else if (event is UpdateUserDetails) {
      await Future.delayed(Duration(seconds: 2));
      await _sharedPreferencesHelper.setLocalUserData(event.user);
      yield UserDetailsLoaded(event.user);
    }
  }
}
