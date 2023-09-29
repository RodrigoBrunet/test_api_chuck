import 'package:flutter/material.dart';
import 'package:test_api_chuck/models/login_model.dart';
import 'package:test_api_chuck/pages/create_user_page.dart';
import 'package:test_api_chuck/pages/home_page.dart';
import 'package:test_api_chuck/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  LoginModel loginModel = LoginModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/images/chuck_norris2.png',
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputWidget(
                        key: const Key('inputEmail'),
                        isVisible: false,
                        obscureText: false,
                        controller: emailController,
                        labelText: const Text('E-mail'),
                        validator: (value) => loginModel
                            .verificaEmailValido(emailController.text),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputWidget(
                        key: const Key('inputPassword'),
                        obscureText: true,
                        controller: senhaController,
                        labelText: const Text('Password'),
                        validator: (value) => loginModel
                            .verificaSenhaPreenchida(senhaController.text),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AnimatedBuilder(
                        animation: loginModel,
                        builder: (_, __) => SizedBox(
                          child: loginModel.statusLoginMessage
                              ? const Text('E-mail ou Senha não confere!',
                                  style: TextStyle(color: Colors.red))
                              : const Text(''),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedBuilder(
                        animation: loginModel,
                        builder: (_, __) => ElevatedButton(
                          key: const Key('elevatedButton'),
                          onPressed: () async {
                            setState(() {
                              loginModel.statusLoginMessage = false;
                            });
                            final FormState form = _formKey.currentState!;
                            if (form.validate()) {
                              await _verifcaUserLogin();
                              if (loginModel.statusLoginMessage == false) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 150),
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CreateUserPage()));
                          },
                          child: const Text('Cadastrar Usuário')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _verifcaUserLogin() async {
    if (emailController.text.isNotEmpty && senhaController.text.isNotEmpty) {
      await loginModel.verificaDadosLogin(
        emailController.text,
        senhaController.text,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    senhaController.dispose();
  }
}
