

import 'package:injectable/injectable.dart';

abstract class AccountRemoteDataSource {

}

@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {


  AccountRemoteDataSourceImpl();


}
