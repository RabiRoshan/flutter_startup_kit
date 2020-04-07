part of 'enter_user_detail_screen_bloc.dart';

abstract class EnterUserDetailScreenState extends Equatable {
  const EnterUserDetailScreenState();
}

class EnterUserDetailScreenInitial extends EnterUserDetailScreenState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoading extends EnterUserDetailScreenState {
  const UserDetailsLoading();

  @override
  List<Object> get props => [];
}

class UserDetailsLoaded extends EnterUserDetailScreenState {
  final User user;

  const UserDetailsLoaded(this.user);

  @override
  List<Object> get props => [user];
}
