import 'package:dartz/dartz.dart';
import 'package:test_tyba/core/usecases/use_cases.dart';
import 'package:test_tyba/features/home/data/models/university_model.dart';
import 'package:test_tyba/features/home/data/repository/home_repository.dart';

import '../../../../core/errors/failure.dart';

class HomeParams {
  HomeParams();
}

class HomeUseCases extends UseCase<List<UniversityModel>, HomeParams> {
  final HomeDataRepository repository;
  HomeUseCases({required this.repository});

  @override
  Future<Either<Failure, List<UniversityModel>>> call(HomeParams params) async {
    return await repository.getUniversity();
  }
}
