import "package:template/core/infrastructure/helpers/repository_helper.dart";

import "../remote/user_remote_datasource.dart";

class UserRepository with RepositoryHelper {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepository(this._userRemoteDataSource);
}
