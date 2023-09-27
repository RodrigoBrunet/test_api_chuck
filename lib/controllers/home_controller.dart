import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_chuck/models/chuck_model.dart';
import 'package:test_api_chuck/repository/chuck_api_repository.dart';
import 'package:test_api_chuck/utils/emun.dart';

class HomeController extends ChangeNotifier {
  ChuckModel? chuckModel;

  ChuckApiRepository repository = ChuckApiRepository();
  LoadingState state = LoadingState.loading;
  var client = http.Client();
  getChuckDataApi() async {
    state = LoadingState.loading;

    try {
      chuckModel = await repository.getApiData(client);
    } catch (exc) {
      throw Exception(exc);
    }
    state = LoadingState.sucess;
    notifyListeners();
  }
}
