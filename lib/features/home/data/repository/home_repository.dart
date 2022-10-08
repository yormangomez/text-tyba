import 'package:dartz/dartz.dart';
import 'package:test_tyba/core/errors/exceptions.dart';
import 'package:test_tyba/core/errors/failure.dart';
import 'package:test_tyba/features/home/data/datasources/home_datasources.dart';
import 'package:test_tyba/features/home/data/models/university_model.dart';

abstract class HomeDataRepository {
  Future<Either<Failure, List<UniversityModel>>> getUniversity();
}

class HomeDataRepositoryImpl extends HomeDataRepository {
  final HomeDataSources homeDataSources;

  HomeDataRepositoryImpl({required this.homeDataSources});

  @override
  Future<Either<Failure, List<UniversityModel>>> getUniversity() async {
    try {
      final homeModel = await homeDataSources.getUniversity();

      return Right(homeModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
