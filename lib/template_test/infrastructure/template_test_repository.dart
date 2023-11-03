import "../../core/infrastructure/helpers/repository_helper.dart";
import "template_test_remote_datasource.dart";

class TemplatetestRepository with RepositoryHelper {
  final TemplatetestRemoteDataSource _templatetestRemoteDataSource;

  TemplatetestRepository(this._templatetestRemoteDataSource);
}
