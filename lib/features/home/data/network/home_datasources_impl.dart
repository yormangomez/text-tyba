import 'package:dio/dio.dart';
import 'package:test_tyba/core/errors/exceptions.dart';
import 'package:test_tyba/features/home/data/datasources/home_datasources.dart';
import 'package:test_tyba/features/home/data/models/university_model.dart';

class HomeDataSourceImpl extends HomeDataSources {
  Dio centerApi = Dio();

  HomeDataSourceImpl();

  @override
  Future<List<UniversityModel>> getUniversity() async {
    try {
      final response = await centerApi.get(
        'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json',
      );

      if (response.statusCode == 200) {
        final List<UniversityModel> body = (response.data as List)
            .map((e) => UniversityModel.fromJson(e))
            .toList();
        print(body);
        return body;
      } else {
        throw GeneralException(
            response.statusMessage ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
