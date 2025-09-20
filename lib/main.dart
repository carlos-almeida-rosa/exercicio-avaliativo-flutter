import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/views/home_view.dart';
import 'package:flutter_avaliativo/widgets/login_form_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio Avaliativo',
      home: LoginWidget(),
      routes: {'/home': (context) => HomeView()},
    );
  }
}
