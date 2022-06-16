import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/createAccount.dart';
import 'package:my_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = 'Login de Usuario';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  Future<void> signIn() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/login';

    Response response = await post(Uri.parse(api),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, String>{'login': _email, 'password': _password}));

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: const Text('E-mail ou senha invalidos'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Voltar Pagina Anterior'),
                    child: const Text('Voltar Pagina Anterior'),
                  )
                ],
              ));
    }
  }

  void createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              onChanged: (text) {
                setState(() {
                  _email = text;
                });
              },
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o e-mail de usuario:'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              onChanged: (text) {
                setState(() {
                  _password = text;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe a senha de usuario:'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextButton(
                onPressed: () {
                  signIn();
                },
                child: Text('Entrar'),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextButton(
                onPressed: () {
                  createAccount();
                },
                child: Text('Nova conta'),
              ))
        ]),
      ),
    );
  }
}
