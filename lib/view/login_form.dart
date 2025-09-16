import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState(){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Por favor, digite o email';
              }
              return null;
            },
          ),
          TextFormField(
            validator: (senha) {
              if(senha == null || senha.isEmpty){
                return 'Por favor, digite a senha';
              }
              return null;
            },
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processind Data')),
                  );
                }
              },
              child: const Text('Entrar'),
            ),
          ),
        ],
      ),
    );
  }
}
