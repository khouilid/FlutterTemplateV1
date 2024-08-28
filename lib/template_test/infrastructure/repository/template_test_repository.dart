 import "../../../core/infrastructure/helpers/repository_helper.dart";
import "../remote/template_test_remote_datasource.dart";
import "../../domain/template_test_domain.dart";
import "../dtos/template_test_dto.dart";
class TemplatetestRepository with RepositoryHelper {
final TemplatetestRemoteDataSource _templatetestRemoteDataSource;
TemplatetestRepository(this._templatetestRemoteDataSource);



// Create Templatetest
FutureEitherFailureOr<TemplatetestDomain> createTemplatetest(TemplatetestDomain  templatetestDomain) async =>
      handleData(                                                                                                         
        _templatetestRemoteDataSource.createTemplatetest(TemplatetestDto.fromDomain(templatetestDomain)),
        (_) async {
          return _.toDomain();
        },);


        
// Get List Templatetest
FutureEitherFailureOr<List<TemplatetestDomain>> getAllTemplatetests() async =>
      handleData(
        _templatetestRemoteDataSource.getAllTemplatetests(),
        (_) async {
          return _.map((e) => e.toDomain()).toList();
        } );

// Get By id Templatetest
FutureEitherFailureOr<TemplatetestDomain> getTemplatetestById(int id) async =>
      handleData(
        _templatetestRemoteDataSource.getTemplatetestById(id),
        (_) async {
          return _.toDomain();
        });

// Update Templatetest
FutureEitherFailureOr<TemplatetestDomain> updateTemplatetest(TemplatetestDomain  templatetestDomain) async =>
      handleData(
        _templatetestRemoteDataSource.updateTemplatetest(TemplatetestDto.fromDomain(templatetestDomain)),
        (_) async {
          return _.toDomain();
        } );

// Delete Templatetest
FutureEitherFailureOr<bool> deleteTemplatetest(int id) async =>
      handleData(
        _templatetestRemoteDataSource.deleteTemplatetest(id),
        (_) async {
          return _;
        });   
}