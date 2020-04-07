part of 'enter_user_detail_screen_bloc.dart';

abstract class EnterUserDetailScreenEvent extends Equatable {
  const EnterUserDetailScreenEvent();
}

class LoadUserDetails extends EnterUserDetailScreenEvent {
  const LoadUserDetails();

  @override
  List<Object> get props => null;
}

class UpdateUserDetails extends EnterUserDetailScreenEvent {
  final User user;

  const UpdateUserDetails(this.user);

  @override
  List<Object> get props => null;
}
