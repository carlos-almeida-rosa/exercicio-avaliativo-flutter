import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  static final CryptoService instance = CryptoService();

  final String _baseUrl =
      'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana&vs_currencies=usd';

  Future<Map<String, dynamic>> fetchCryptoPrices() async {
    final url = Uri.parse(_baseUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Falha ao buscar preços');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}
