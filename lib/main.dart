import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/view/login_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Bem vindo!';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle), centerTitle: true,),
        body: const LoginForm(),
      ),
    );
  }
}