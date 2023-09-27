import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:test_api_chuck/models/chuck_model.dart';
import 'package:test_api_chuck/repository/chuck_api_repository.dart';

@GenerateMocks([http.Client])
void main() {
  ChuckApiRepository repository = ChuckApiRepository();
  test(
      'Deve retornar um Model se a chamada http for completada com sucesso => status code - 200',
      () async {
    final client = MockClient(
      (_) async => http.Response(
        jsonReturn,
        200,
      ),
    );
    expect(await repository.getApiData(client), isA<ChuckModel>());
  });
  test(
      'Deve retornar uma exception quando a chamada http retornar => status code - 404',
      () {
    final client =
        MockClient((_) async => http.Response('Falha ao buscar dados', 404));
    expect(repository.getApiData(client), throwsException);
  });
}

var jsonReturn =
    '''{"categories":[],"created_at":"2020-01-05 13:42:30.177068","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png",
    "id":"16IFnuNCRaWvfkqMnYZMAQ","updated_at":"2020-01-05 13:42:30.177068","url":"https://api.chucknorris.io/jokes/16IFnuNCRaWvfkqMnYZMAQ",
    "value":"Chuck Norris once dug a hole... to the bottom of the ocean."}''';
