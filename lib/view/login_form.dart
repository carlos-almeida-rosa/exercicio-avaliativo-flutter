import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/view/home_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10.0,
        children: [
          TextFormField(
            validator: (email) {
              print(email);
              if (email == null || email.isEmpty) {
                return 'Por favor, digite o email';
              }
              return null;
            },
          ),
          TextFormField(
            validator: (senha) {
              print(senha);
              if (senha == null || senha.isEmpty) {
                return 'Por favor, digite a senha';
              }
              return null;
            },
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.0,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processind Data')),
                    //   );
                    // }
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (context) => const HomeView(),
                    ),
                    );
                  },
                  child: const Text('Entrar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processind Data')),
                    //   );
                    // }
                  },
                  child: const Text('Recuperar senha'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
