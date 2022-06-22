import 'package:flutter/material.dart';

// pagina da Lista de Produto
class Lista extends StatelessWidget {
  Lista({Key? key, required this.datalist}) : super(key: key);

  final List<dynamic> datalist;

  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ListView.builder",
        theme: new ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false,
        home: new ListViewBuilder(datalist: datalist));
  }
}

// Lista de Produto
class ListViewBuilder extends StatelessWidget {
  var datalist;

  ListViewBuilder({Key? key, this.datalist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listagem de Produtos")),
      body: ListView.builder(
          itemCount: datalist.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.list),
                trailing: Text(
                  "",
                  style: TextStyle(color: Colors.orange, fontSize: 15),
                ),
                title: Text(datalist[index]['name']));
          }),
    );
  }
}
