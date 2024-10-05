// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source/local/account_local_data_source.dart' as _i426;
import '../data/data_source/remote/account_remote_data_source.dart' as _i300;
import '../data/repositories/account_repository_impl.dart' as _i870;
import '../domain/repositories/account_repository.dart' as _i64;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i300.AccountRemoteDataSource>(
      () => _i300.AccountRemoteDataSourceImpl());
  gh.lazySingleton<_i426.AccountLocalDataSource>(
      () => _i426.AccountLocalDataSourceImpl());
  gh.lazySingleton<_i64.AccountRepository>(() => _i870.AccountRepositoryImpl());
  return getIt;
}
