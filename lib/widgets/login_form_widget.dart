import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/models/user_model.dart';
import 'package:flutter_avaliativo/services/auth_service.dart';
import 'package:flutter_avaliativo/views/home_view.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Autenticar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: username,
                decoration: InputDecoration(labelText: 'Usuário'),
                validator: (value) =>
                    value!.isEmpty ? "Digite seu usuário" : null,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "Digite uma senha" : null,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool login = await AuthService.instance.login(
                      username.text,
                      password.text,
                    );
                    if (login) {
                      navigator.pushReplacementNamed('/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Falha ao autenticar")),
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
