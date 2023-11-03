 

import "../../core/infrastructure/helpers/repository_helper.dart";
import "testpayment_remote_datasource.dart";

class TestpaymentRepository with RepositoryHelper {

final TestpaymentRemoteDataSource _testpaymentRemoteDataSource;

TestpaymentRepository(this._testpaymentRemoteDataSource);
  
         
}