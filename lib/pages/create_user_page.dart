import 'package:flutter/material.dart';
import 'package:test_api_chuck/controllers/create_user_controller.dart';
import 'package:test_api_chuck/models/login_model.dart';
import 'package:test_api_chuck/pages/login_page.dart';
import 'package:test_api_chuck/utils/emun.dart';
import 'package:test_api_chuck/widgets/input_widget.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  LoginModel loginModel = LoginModel();
  CreateUserController createUserController = CreateUserController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create UserPage'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: AnimatedBuilder(
        animation: createUserController,
        builder: (__, _) => _body(context),
      ),
    );
  }

  _dialogUserAddSucess() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          title: const Text(
            'Usuário cadastrado com sucesso !!!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: const SizedBox(
            height: 50,
            child: Text(
              'Seja bem vindo ao consumo de API ChuckNorris...',
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text('Fazer meu login'),
              ),
            ),
          ],
        );
      },
    );
  }

  _body(BuildContext context) {
    if (createUserController.state == LoadingState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (createUserController.state == LoadingState.error) {
      return const Center(
        child: Text('Algo deu errado, tente novamente mais tarde'),
      );
    } else if (createUserController.state == LoadingState.stopped) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              InputWidget(
                obscureText: false,
                isVisible: false,
                labelText: const Text('E-mail'),
                controller: emailController,
                validator: (value) =>
                    loginModel.verificaEmailValido(emailController.text),
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                controller: passwordController,
                labelText: const Text('password'),
                validator: (value) =>
                    loginModel.verificaSenhaPreenchida(passwordController.text),
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                obscureText: false,
                isVisible: false,
                controller: ageController,
                labelText: const Text('Age'),
                validator: (value) =>
                    loginModel.verificaIdade(ageController.text),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  final FormState form = _formKey.currentState!;
                  if (form.validate()) {
                    createUserController.createUser(
                      emailController.text,
                      passwordController.text,
                    );
                    _dialogUserAddSucess();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 135),
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Cadastrar',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
  }
}
