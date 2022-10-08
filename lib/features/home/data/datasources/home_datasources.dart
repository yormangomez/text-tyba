import 'package:test_tyba/features/home/data/models/university_model.dart';

abstract class HomeDataSources {
  Future<List<UniversityModel>> getUniversity();
}
