import 'package:flutter/material.dart';
import 'package:test_api_chuck/data/prefs.dart';
import 'package:test_api_chuck/utils/emun.dart';

class CreateUserController extends ChangeNotifier {
  LoadingState state = LoadingState.stopped;

  createUser(String email, String senha) async {
    state = LoadingState.loading;
    try {
      await PrefsDb.saveValue(
        email,
        senha,
      );
    } catch (error) {
      state = LoadingState.error;
      throw Exception(error);
    }
    state = LoadingState.stopped;
  }
}
