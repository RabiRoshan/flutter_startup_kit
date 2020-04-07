import 'user_repo.dart';

class Repos {
  final UserRepo userRepo;

  // Private constructor
  Repos._({this.userRepo});

  factory Repos.fake() => Repos._(
        userRepo: UserFakeRepo(),
      );

  factory Repos.http() => Repos._(
        userRepo: UserHttpRepo(),
      );
}
