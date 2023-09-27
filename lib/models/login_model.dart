import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_api_chuck/data/prefs.dart';

class LoginModel extends ChangeNotifier {
  // ignore: overridden_fields, annotate_overrides
  String? email;
  String? senha;

  LoginModel({
    this.email,
    this.senha,
  });
  bool statusLoginMessage = false;

  verificaEmailValido(String email) {
    bool emailValido = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    if (email.isEmpty) {
      return 'O campo e-mail é obrigatório';
    } else if (emailValido) {
      return null;
    } else {
      return 'E-mail é inválido';
    }
  }

  verificaSenhaPreenchida(String senha) {
    if (senha.isEmpty) {
      return 'O campo senha é obrigatório';
    } else if (senha.length > 1 && senha.length < 4) {
      return 'Senha deve conter no minimo 4 caracteres';
    }
  }

  verificaIdade(String idade) {
    if (idade.isEmpty) {
      return 'Idade é obrigatório';
    } else {
      return null;
    }
  }

  Future<void> verificaDadosLogin(String email, String senha) async {
    var dataUser = await PrefsDb.getValue('chave');
    if (dataUser != null) {
      var decode = await jsonDecode(dataUser);
      var emailBd = decode['email'].toString();
      var senhaBd = decode['password'].toString();
      if (email == emailBd && senha == senhaBd) {
        statusLoginMessage = false;
      } else {
        statusLoginMessage = true;
      }
    } else {
      statusLoginMessage = true;
    }

    notifyListeners();
  }
}
