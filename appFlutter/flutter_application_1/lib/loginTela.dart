import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'inicioPage.dart';
import 'cadastroUsuario.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Declaração de variaveis
  String _email = '';
  String _senha = '';

  // Chamada da API-Login
  void signIn() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/login';

    // Formato de chamada da API
    Response response = await post(
      Uri.parse(api),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'login': _email, 'password': _senha}),
    );
    
    // Resposta de statusCode da API
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InicioPage())
      );
    } else {
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: const Text('Login ou senha inválido(a) Tente novamente!'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  // Function de chamada de criação de conta
  void CriarConta() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CriacaoContaPagina()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Corpo da Tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            // - Padding de email - INICIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child:TextFormField(
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o e-mail:',
                ),
              )
            ),
            // - Padding de email - FIM

            // - Padding de senha - INICIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:TextFormField(
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    _senha = text;
                  });
                },
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe a senha:',
                ),
              ),
            ),
            // - Padding de senha - FIM

            // Padding do Botão - INICIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  signIn();
                },
                child: const Text('Entrar'),
              ),
            ),
            // Padding do Botão - FIM

            // Padding do Botão Cadastro - INICIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  CriarConta();
                },
                child: const Text('Cadastrar Usuario'),
              ),
            )
            // Padding do Botão Cadastro - FIM

          ],
        ),
      ),
    );
  }
}
