import 'dart:convert';
import 'package:http/http.dart' as http;

class AccessTokens {
  AccessTokens({
    required this.orderAccessToken,
    required this.customerAccessToken,
  });

  factory AccessTokens.fromMap(Map<String, dynamic> map) {
    return AccessTokens(
      orderAccessToken: map['order_access_token'] ?? '',
      customerAccessToken: map['customer_access_token'] ?? '',
    );
  }

  factory AccessTokens.fromJson(String source) =>
      AccessTokens.fromMap(json.decode(source));

  final String orderAccessToken;
  final String customerAccessToken;

  Map<String, dynamic> toMap() {
    return {
      'order_access_token': orderAccessToken,
      'customer_access_token': customerAccessToken,
    };
  }

  String toJson() => json.encode(toMap());
}

class DemoApi {
  DemoApi.setup({required this.baseUrl}) {
    DemoApi._instance = this;
  }

  final String baseUrl;

  static DemoApi? _instance;
  static DemoApi get instance => _instance!;

  String get query => 'platform=flutter';

  Future<AccessTokens> checkout({required int amount}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/checkout?$query'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'price': amount,
      }),
    );

    return AccessTokens.fromJson(response.body);
  }

  Future<String> getProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/profile?$query'),
    );

    return jsonDecode(response.body)['customer_access_token'];
  }
}
