import 'package:http/http.dart' as http;
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/core/error/server_exceptions.dart';
import 'package:machinetest/features/medical_app/domain/entity/medical_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  // /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Problems> getMedicalData();
}

class GetMedicalProblems implements NumberTriviaRemoteDataSource {
  GetMedicalProblems();

  // @override
  // Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
  //     _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<Problems> getMedicalData() => _getMedicalDataFromUrl(MEDICAL_API);

  Future<Problems> _getMedicalDataFromUrl(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Problems.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
