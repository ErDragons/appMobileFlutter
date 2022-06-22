import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'lista.dart';


class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);
  //declaração de titulo
  final String title = 'Exibir Produtos';

  @override
  State<InicioPage> createState() => _Lista();
}

//API de Lista
class _Lista extends State<InicioPage> {
  void Exibir() async {
    const request = 'https://example-ecommerce.herokuapp.com/product/list';

    Response response = await get(Uri.parse(request));

    final List<dynamic> dataList = jsonDecode(response.body);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Lista(datalist: dataList)),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextButton(
                onPressed: () {
                  // function que chama API de lista
                  Exibir();
                },
                child: const Text('Produtos'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
