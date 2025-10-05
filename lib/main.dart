import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/services/auth_service.dart';
import 'package:flutter_avaliativo/views/home_view.dart';
import 'package:flutter_avaliativo/widgets/login_form_widget.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Avaliativo',
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeView(),
        '/login': (context) => LoginView(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    bool hasToken = await AuthService.instance.verifyToken();
    if (hasToken) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
