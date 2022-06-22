import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'inicioPage.dart';

class CriacaoContaPagina extends StatefulWidget {
  CriacaoContaPagina({Key? key}) : super(key: key);

  final String title = 'Criar Conta';

  @override
  State<CriacaoContaPagina> createState() => _CriacaoContaPaginaState();
}

class _CriacaoContaPaginaState extends State<CriacaoContaPagina> {
  // Declaração de variaveis
  String _endereco = '';
  int _idade = 0;
  String _age = '';
  String _email = '';
  String _nome = '';
  String _senhaUsuario = '';

  void send() async {
    String api = 'https://example-ecommerce.herokuapp.com/user/customer/add';

    _idade = int.parse(_age);
    // Formato de chamada da API
    Response response = await post(Uri.parse(api),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'address': _endereco,
          'age': _idade,
          'email': _email,
          'name': _nome,
          'userPassword': _senhaUsuario,
        }));
    print(response.body);

    // Resposta de statusCode da API
    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InicioPage()),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: const Text('Falha ao criar conta, Tente Novamente!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Voltar'),
                    child: const Text('Voltar'),
                  )
                ],
              ));
    }
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
              // Padding Endereco - INICIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _endereco = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe o seu endereço:'),
                ),
              ),
              // Padding Endereco - FIM

              // Padding Idade - INICIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _age = text;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe a sua idade:'),
                ),
              ),
              // Padding Idade - FIM

              // Padding Email - INICIO
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
                      labelText: 'Informe o seu e-mail:'),
                ),
              ),
              // Padding Email - FIM

              // Padding Nome - INICIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _nome = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe o seu nome:'),
                ),
              ),
              // Padding Nome - FIM

              // Padding SenhaUsuario - INICIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      _senhaUsuario = text;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Informe a sua senha:'),
                ),
              ),
              // Padding SenhaUsuario - FIM

              // Padding Botão - INICIO
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextButton(
                    onPressed: () {
                      send();
                    },
                    child: Text('Enviar'),
                  ))
              // Padding Botão - FIM
            ]),
      ),
    );
  }
}
