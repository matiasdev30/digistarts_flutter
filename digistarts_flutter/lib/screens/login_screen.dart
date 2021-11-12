import 'package:digistarts_flutter_test/constants.dart';
import 'package:digistarts_flutter_test/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/logo.png',
            ),
            const SizedBox(
              height: 40,
            ),
            const Text.rich(
              TextSpan(
                text: 'Consultoria',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nOutsourcing de',
                  ),
                  TextSpan(text: ' TI', style: TextStyle(color: primaryColor)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Por favor, insira os detalhes abaixo\npara continuar.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                )),
            const SizedBox(
              height: 20,
            ),
            _textFormField(label: "example@gmail.com", title: "Email"),
            const SizedBox(
              height: 20,
            ),
            _textFormField(label: "********", title: "Palavra-passe"),
            const SizedBox(
              height: 40,
            ),
            _btn(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _textFormField({String? title, String? label}) {
    return SizedBox(
      width: Get.width - (Get.width - 240),
      height: 40,
      child: Container(
        padding: const EdgeInsets.only(left: defaultPadding),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextFormField(
            obscureText: title!.contains('passe') ? true : false,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: const TextStyle(fontSize: 15)),
          ),
        ),
      ),
    );
  }

  _btn() {
    return GestureDetector(
      onTap: () => Get.to(HomeScreen()),
      child: Container(
        width: Get.width - (Get.width - 160),
        height: 40,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            'Entrar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
