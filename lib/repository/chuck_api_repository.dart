import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_api_chuck/models/chuck_model.dart';
import 'package:test_api_chuck/utils/constants.dart';

class ChuckApiRepository {
  Future<ChuckModel?> getApiData(http.Client client) async {
    final response = await client.get(Uri.parse(urlPath));
    if (response.statusCode == 200) {
      return ChuckModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao buscar dados');
    }
  }
}
