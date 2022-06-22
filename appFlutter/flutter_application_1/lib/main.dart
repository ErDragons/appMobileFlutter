import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginTela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho refeito',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: const MyLoginPage(title: 'Flutter Home Page'),
    );
  }
}


