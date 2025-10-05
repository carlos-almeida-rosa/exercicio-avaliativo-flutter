import 'package:flutter/material.dart';
import 'package:flutter_avaliativo/services/auth_service.dart';
import 'package:flutter_avaliativo/services/crypto_service.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, dynamic>? cryptoPrices;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchPrices();
    });
  }

  Future<void> fetchPrices() async {
    try {
      final data = await CryptoService.instance.fetchCryptoPrices();
      if (!mounted) return;
      setState(() {
        cryptoPrices = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      print('Erro ao buscar preços: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preços de Criptomoedas'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await AuthService.instance.logout();
              if (mounted) {
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200, maxHeight: 200),
                child: Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_usmfx6bp.json',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                CryptoCard(
                  name: 'Bitcoin',
                  price: cryptoPrices?['bitcoin']['usd']?.toDouble() ?? 0,
                ),
                CryptoCard(
                  name: 'Ethereum',
                  price: cryptoPrices?['ethereum']['usd']?.toDouble() ?? 0,
                ),
                CryptoCard(
                  name: 'Solana',
                  price: cryptoPrices?['solana']['usd']?.toDouble() ?? 0,
                ),
              ],
            ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String name;
  final double price;

  const CryptoCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(name, style: Theme.of(context).textTheme.titleLarge),
        trailing: Text(
          '\$${price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
