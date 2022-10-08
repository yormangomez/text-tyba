import 'package:get_it/get_it.dart';
import 'package:test_tyba/features/home/data/datasources/home_datasources.dart';
import 'package:test_tyba/features/home/data/network/home_datasources_impl.dart';
import 'package:test_tyba/features/home/data/repository/home_repository.dart';
import 'package:test_tyba/features/home/domain/usecases/home_usecases.dart';
import 'package:test_tyba/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => HomeBloc(homeUseCases: sl()));
  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => HomeUseCases(repository: sl()));
  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeDataRepository>(
      () => HomeDataRepositoryImpl(homeDataSources: sl()));
  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourceImpl());
}
