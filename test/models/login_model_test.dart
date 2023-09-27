import 'package:flutter_test/flutter_test.dart';
import 'package:test_api_chuck/models/login_model.dart';

void main() {
  LoginModel loginModel = LoginModel();

  group('teste input | ', () {
    test(
        'Deve retornar texto [O campo e-mail é obrigatório] quando campo email for vazio',
        () {
      expect(
          'O campo e-mail é obrigatório', loginModel.verificaEmailValido(''));
    });
    test('Deve retornar um email válido quando a função for chamada', () {
      expect(null, loginModel.verificaEmailValido('rodrigo@gmail.com'));
    });
    test('Deve retornar texto [E-mail é inválido] quando o email for inválido',
        () {
      expect(
          'E-mail é inválido', loginModel.verificaEmailValido('rodrigo@gmail'));
    });
    test('Deve retornar uma senha válida quando a função for chamada', () {
      expect(null, loginModel.verificaSenhaPreenchida('Senha@123'));
    });
    test(
        'Deve retornar texto [O campo senha é obrigatório] quando o campo for vazio',
        () {
      expect('O campo senha é obrigatório',
          loginModel.verificaSenhaPreenchida(''));
    });
    test(
        'Deve retornar text [Senha deve conter pelo menos 4 caracteres] quando o campo for chamado',
        () {
      expect('Senha deve conter no minimo 4 caracteres',
          loginModel.verificaSenhaPreenchida('123'));
    });
  });
}
