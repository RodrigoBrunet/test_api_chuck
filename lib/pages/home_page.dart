import 'package:flutter/material.dart';
import 'package:test_api_chuck/controllers/home_controller.dart';
import 'package:test_api_chuck/pages/login_page.dart';
import 'package:test_api_chuck/utils/constants.dart';
import 'package:test_api_chuck/utils/emun.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final controller = HomeController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getValueChuck();
  }

  _getValueChuck() async {
    await controller.getChuckDataApi();
  }

  Widget _bodyHome() {
    if (controller.state == LoadingState.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 4, top: 12),
                color: Colors.grey.shade200,
                width: double.infinity,
                child: Text(
                    'Create Date: ${controller.chuckModel?.parseDate() ?? dataEmpty}')),
            Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 4, top: 2),
                color: Colors.grey.shade200,
                width: double.infinity,
                child: Text('Id: ${controller.chuckModel?.id ?? dataEmpty}')),
            Container(
                margin: const EdgeInsets.only(left: 12, right: 12, top: 2),
                child: Text(controller.chuckModel?.value! ?? dataEmpty)),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: const Text('Home Page', key: Key('tituloPage')),
          actions: [
            controller.state == LoadingState.loading
                ? Container()
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: _bodyHome(),
      ),
    );
  }
}
