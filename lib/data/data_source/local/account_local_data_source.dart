

import 'package:injectable/injectable.dart';

abstract class AccountLocalDataSource {

}

@LazySingleton(as: AccountLocalDataSource)
class AccountLocalDataSourceImpl implements AccountLocalDataSource {

}
