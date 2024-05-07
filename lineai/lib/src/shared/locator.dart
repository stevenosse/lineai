import 'package:lineai/src/core/routing/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:lineai/src/datasource/repositories/auth_repository.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton(() => AuthRepository());
